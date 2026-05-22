library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)
library(ggpubr)
library(openxlsx)
library(tibble)

file_scales <- "vl_am_br_tu_hm.xlsx"
file_cells <- "cell_d.xlsx"
file_tral <- "tral_.xlsx"
file_ib <- "ib_fusi.xlsx"

clean_numeric <- function(x) {
  x <- as.character(x)
  x <- str_replace_all(x, ",", ".")
  as.numeric(x)
}

tbl_scales_raw <- read_excel(file_scales) %>% mutate(across(everything(), clean_numeric))
tbl_cells_raw <- read_excel(file_cells) %>% mutate(across(everything(), clean_numeric))
tbl_tral_raw <- read_excel(file_tral) %>% mutate(across(everything(), clean_numeric))
tbl_ib_raw <- read_excel(file_ib) %>% mutate(across(everything(), clean_numeric))

# ГРАФИК ШИРИНЫ ДЛИНЫ ЧЕШУЕК ВСЕХ КРОМЕ IB, TRAL
tbl_scales_plot <- tbl_scales_raw %>% mutate(row_id = row_number())
df_scales_plot <- tbl_scales_plot %>%
  pivot_longer(cols = -row_id, names_to = c("trait", "strain"), names_pattern = "plate_(length|width)_(.+)", values_to = "value") %>%
  pivot_wider(id_cols = c(row_id, strain), names_from = trait, values_from = value) %>%
  filter(!is.na(length) & !is.na(width))

scale_colors_main <- c(br = "purple", mk = "brown", tu = "orange", vl = "#2BB673", am = "red", hm = "lightblue")
selected_scale_strains <- c("br", "mk", "am")

plot_morpho <- function(data, colors_vector) {
  ggplot(data, aes(x = width, y = length)) +
    stat_ellipse(aes(fill = strain), geom = "polygon", type = "norm", level = 0.95, alpha = 0.25, color = NA) +
    geom_point(aes(color = strain), size = 2, alpha = 0.9) +
    scale_color_manual(values = colors_vector) +
    scale_fill_manual(values = colors_vector) +
    theme_bw(base_size = 14) +
    theme(panel.grid.major = element_line(color = "grey80"), panel.grid.minor = element_line(color = "grey90")) +
    labs(x = "Ширина лодочковидных чешуек, мкм", y = "Длина лодочковидных чешуек, мкм", color = "Strain", fill = "Strain")
}

plot_scales_all <- plot_morpho(df_scales_plot, scale_colors_main)
plot_scales_selected <- plot_morpho(df_scales_plot %>% filter(strain %in% selected_scale_strains), scale_colors_main[selected_scale_strains])

plot_scales_all
plot_scales_selected

# ГРАФИКИ ДИАМЕТРА КЛЕТОК
tbl_cells_plot <- tbl_cells_raw
colnames(tbl_cells_plot) <- make.unique(colnames(tbl_cells_plot))

df_cells_plot <- tbl_cells_plot %>%
  pivot_longer(cols = everything(), names_to = "strain_raw", values_to = "diameter") %>%
  mutate(strain = str_remove(strain_raw, "^cell_d_"), strain = str_remove(strain, "\\.\\d+$")) %>%
  filter(!is.na(diameter))

cell_order <- c("am", "br", "vl", "hm", "trp", "ib", "tu")
cell_colors <- c(br = "purple", tu = "orange", vl = "#2BB673", am = "red", hm = "lightblue", trp = "#d95f02", ib = "#a6761d")

df_cells_plot <- df_cells_plot %>% mutate(strain = factor(strain, levels = cell_order))
df_cells_means <- df_cells_plot %>% group_by(strain) %>% summarise(mean_d = mean(diameter), .groups = "drop")

ggplot(df_cells_plot, aes(x = strain, y = diameter, color = strain)) +
  geom_jitter(width = 0.2, size = 3, alpha = 0.75) +
  geom_crossbar(data = df_cells_means, aes(x = strain, y = mean_d, ymin = mean_d, ymax = mean_d), width = 0.5, linetype = "solid", linewidth = 0.5, color = "black") +
  scale_color_manual(values = cell_colors, drop = FALSE) +
  theme_bw(base_size = 10) +
  theme(panel.grid.major = element_line(color = "grey80"), panel.grid.minor = element_line(color = "grey90"), legend.position = "none") +
  labs(x = "Клональная культура", y = "Диаметр клетки, мкм")

# СВОДНАЯ ТАБЛИЦА
tbl_cells_matrix <- tbl_cells_raw
colnames(tbl_cells_matrix) <- make.unique(colnames(tbl_cells_matrix))

df_cells_matrix <- tbl_cells_matrix %>%
  pivot_longer(cols = everything(), names_to = "strain_raw", values_to = "diameter") %>%
  mutate(strain = str_remove(strain_raw, "^cell_d_"), strain = str_remove(strain, "\\.\\d+$")) %>%
  filter(!is.na(diameter)) %>%
  mutate(strain = factor(strain, levels = cell_order))

anova_cells_matrix <- aov(diameter ~ strain, data = df_cells_matrix)
tukey_cells_matrix <- TukeyHSD(anova_cells_matrix)

df_tukey_cells_matrix <- as.data.frame(tukey_cells_matrix$strain)
df_tukey_cells_matrix$comparison <- rownames(df_tukey_cells_matrix)
rownames(df_tukey_cells_matrix) <- NULL
df_tukey_cells_matrix <- df_tukey_cells_matrix %>% separate(comparison, into = c("group1", "group2"), sep = "-") %>% select(group1, group2, p_adj = `p adj`)

cell_levels_matrix <- levels(df_cells_matrix$strain)
mat_cells_pval <- matrix(NA_real_, nrow = length(cell_levels_matrix), ncol = length(cell_levels_matrix), dimnames = list(cell_levels_matrix, cell_levels_matrix))

for (i in seq_len(nrow(df_tukey_cells_matrix))) {
  g1 <- df_tukey_cells_matrix$group1[i]
  g2 <- df_tukey_cells_matrix$group2[i]
  p <- df_tukey_cells_matrix$p_adj[i]
  mat_cells_pval[g1, g2] <- p
  mat_cells_pval[g2, g1] <- p
}

diag(mat_cells_pval) <- NA

df_cells_pval <- as.data.frame(mat_cells_pval) %>% rownames_to_column("strain")

write.xlsx(df_cells_pval, "D_tukey_pvalue_matrix.xlsx", overwrite = TRUE)
write.xlsx(df_tukey_cells_matrix, "D_tukey_pairs.xlsx", overwrite = TRUE)

# СВОДНАЯ ТАБЛИЦА, ШИРИНА ЛОДОЧКОВИДНЫХ ЧЕШУЕК
tbl_scales_width <- tbl_scales_raw %>% mutate(row_id = row_number())
df_scales_width <- tbl_scales_width %>%
  pivot_longer(cols = -row_id, names_to = c("trait", "strain"), names_pattern = "plate_(length|width)_(.+)", values_to = "value") %>%
  pivot_wider(id_cols = c(row_id, strain), names_from = trait, values_from = value) %>%
  filter(!is.na(length) & !is.na(width)) %>%
  mutate(strain = factor(strain, levels = c("br", "tu", "vl", "am", "hm")))

anova_scales_width <- aov(width ~ strain, data = df_scales_width)
summary(anova_scales_width)

tukey_scales_width <- TukeyHSD(anova_scales_width)
df_tukey_scales_width <- as.data.frame(tukey_scales_width$strain)
df_tukey_scales_width$comparison <- rownames(df_tukey_scales_width)
rownames(df_tukey_scales_width) <- NULL
df_tukey_scales_width <- df_tukey_scales_width %>% separate(comparison, into = c("group1", "group2"), sep = "-") %>% select(group1, group2, p_adj = `p adj`)

scale_levels_width <- levels(df_scales_width$strain)
mat_scales_width <- matrix(NA_real_, nrow = length(scale_levels_width), ncol = length(scale_levels_width), dimnames = list(scale_levels_width, scale_levels_width))

for (i in seq_len(nrow(df_tukey_scales_width))) {
  g1 <- df_tukey_scales_width$group1[i]
  g2 <- df_tukey_scales_width$group2[i]
  p <- df_tukey_scales_width$p_adj[i]
  mat_scales_width[g1, g2] <- p
  mat_scales_width[g2, g1] <- p
}

diag(mat_scales_width) <- NA
df_scales_width_pval <- as.data.frame(mat_scales_width) %>% rownames_to_column("strain")

write.xlsx(df_scales_width_pval, "tukey_width_matrix.xlsx", overwrite = TRUE)
write.xlsx(df_tukey_scales_width, "tukey_width_pairs.xlsx", overwrite = TRUE)

# СВОДНАЯ ТАБЛИЦА, ДЛИНА ЛОДОЧКОВИДНЫХ ЧЕШУЕК
tbl_scales_length <- tbl_scales_raw %>% mutate(row_id = row_number())
df_scales_length <- tbl_scales_length %>%
  pivot_longer(cols = -row_id, names_to = c("trait", "strain"), names_pattern = "plate_(length|width)_(.+)", values_to = "value") %>%
  pivot_wider(id_cols = c(row_id, strain), names_from = trait, values_from = value) %>%
  filter(!is.na(length) & !is.na(width)) %>%
  mutate(strain = factor(strain, levels = c("am", "br", "vl", "hm", "tu")))

anova_scales_length <- aov(length ~ strain, data = df_scales_length)
summary(anova_scales_length)

tukey_scales_length <- TukeyHSD(anova_scales_length)
df_tukey_scales_length <- as.data.frame(tukey_scales_length$strain)
df_tukey_scales_length$comparison <- rownames(df_tukey_scales_length)
rownames(df_tukey_scales_length) <- NULL
df_tukey_scales_length <- df_tukey_scales_length %>% separate(comparison, into = c("group1", "group2"), sep = "-") %>% select(group1, group2, p_adj = `p adj`)

scale_levels_length <- levels(df_scales_length$strain)
mat_scales_length <- matrix(NA_real_, nrow = length(scale_levels_length), ncol = length(scale_levels_length), dimnames = list(scale_levels_length, scale_levels_length))

for (i in seq_len(nrow(df_tukey_scales_length))) {
  g1 <- df_tukey_scales_length$group1[i]
  g2 <- df_tukey_scales_length$group2[i]
  p <- df_tukey_scales_length$p_adj[i]
  mat_scales_length[g1, g2] <- p
  mat_scales_length[g2, g1] <- p
}

diag(mat_scales_length) <- NA
df_scales_length_pval <- as.data.frame(mat_scales_length) %>% rownames_to_column("strain")

write.xlsx(df_scales_length_pval, "tukey_length_matrix.xlsx", overwrite = TRUE)
write.xlsx(df_tukey_scales_length, "tukey_length_pairs.xlsx", overwrite = TRUE)

# СТАТИСТИКА по штамму TRAL
tbl_tral_stats <- tbl_tral_raw %>% mutate(row_id = row_number())
df_tral_stats <- tbl_tral_stats %>%
  pivot_longer(cols = -row_id, names_to = c("trait", "scale_type"), names_pattern = "plate_(length|width)_(.+)", values_to = "value") %>%
  pivot_wider(id_cols = c(row_id, scale_type), names_from = trait, values_from = value) %>%
  filter(!is.na(length) & !is.na(width)) %>%
  mutate(scale_type = factor(scale_type, levels = unique(scale_type), labels = c("A", "B")))

ggplot(df_tral_stats, aes(x = width, y = length)) +
  stat_ellipse(aes(fill = scale_type), geom = "polygon", type = "norm", level = 0.95, alpha = 0.25, color = NA) +
  geom_point(aes(color = scale_type), size = 2, alpha = 0.9) +
  scale_color_manual(values = c(A = "red", B = "blue")) +
  scale_fill_manual(values = c(A = "red", B = "blue")) +
  theme_bw(base_size = 14) +
  theme(panel.grid.major = element_line(color = "grey80"), panel.grid.minor = element_line(color = "grey90")) +
  labs(x = "Plate width", y = "Plate length", color = "Scale type", fill = "Scale type")

shapiro.test(df_tral_stats$length)
shapiro.test(df_tral_stats$width)

t_width_tral <- t.test(width ~ scale_type, data = df_tral_stats)
t_width_tral

t_length_tral <- t.test(length ~ scale_type, data = df_tral_stats)
t_length_tral