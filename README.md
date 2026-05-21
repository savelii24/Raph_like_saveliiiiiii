## RU // EN

---

## Биоинформатические и статистические данные в магистерской работе на тему: «Филогения, систематика и эволюция _Raphidocystis_-подобных центрохелидных солнечников (Haptista: Centroplasthelida)»
### Автор: Полузеров Савелий Андреевич
### Структура репозитория

```text
.
├── bioinf_SP/
│   ├── 28s_18s.xlsx
│   ├── concatenated_alignment.fasta
│   ├── Baye_single_28s.tre
│   ├── Baye_single_18s.tre
│   ├── Baye_final_concat.tre
│   ├── RAxML_single_28s.result
│   ├── RAxML_single_18s.result
│   └── RAxML_final_concat.result
│
└── stat_SP/
    ├── ALL_morhometry.R
    ├── cell_d.xlsx
    ├── vl_am_br_tu_hm.xlsx
    ├── tral_.xlsx
    └── ib_fusi.xlsx
```

### Описание данных

Приложение 4 содержит информацию о статистической и биоинформатической обработке данных. Ниже дано описание данных.

#### `bioinf_SP` — биоинформатическая обработка

| Файл | Описание |
|---|---|
| `28s_18s.xlsx` | Таблица с метаданными по последовательностям генов 18S и 28S рРНК, использованных в анализе. В таблице отображены названия последовательностей, источник, биотоп и географическая точка, из которых изолирован материал, аннотация и непосредственно сами последовательности генов 18S и 28S рРНК. |
| `concatenated_alignment.fasta` | Конкатенированное выравнивание последовательностей генов 18S и 28S рРНК. |
| `Baye_single_28s.tre` / `Baye_single_18s.tre` / `Baye_final_concat.tre` | Молекулярно-филогенетические деревья, построенные методом байесовского анализа, соответственно, на основе последовательностей гена 28S рРНК, 18S рРНК и конкатенированного выравнивания 18S и 28S рРНК. |
| `RAxML_single_28s.result` / `RAxML_single_18s.result` / `RAxML_final_concat.result` | Молекулярно-филогенетические деревья, построенные методом максимального правдоподобия, соответственно, на основе последовательностей гена 28S рРНК, 18S рРНК и конкатенированного выравнивания 18S и 28S рРНК. |

#### `stat_SP` — статистическая обработка данных

| Файл | Описание |
|---|---|
| `ALL_morhometry.R` | Скрипт на языке программирования R, в котором отображены статистические анализы, проведенные в ходе работы. Также скрипт содержит код для построения графиков. Необходимые дополнительные пакеты для работы скрипта: `readxl`, `dplyr`, `tidyr`, `stringr`, `ggplot2`, `ggpubr`, `openxlsx`, `tibble`. |
| `cell_d.xlsx` | Измерения диаметра клетки для каждого штамма, изученного в ходе работы. |
| `vl_am_br_tu_hm.xlsx` | Измерения длины и ширины пластинчатых чешуек штаммов Tur, Vla, Amet, Bar и HM-5Z. |
| `tral_.xlsx` | Измерения длины и ширины внутренних и внешних чешуек штамма Tral. |
| `ib_fusi.xlsx` | Измерение длины веретеновидных чешуек штамма Ib. |

---

## Bioinformatic and statistical data for master's thesis “Phylogeny, systematics, and evolution of _Raphidocystis_-like centrohelid heliozoans (Haptista: Centroplasthelida)”
### Author: Poluzerov Savelii

### Repository structure

```text
.
├── bioinf_SP/
│   ├── 28s_18s.xlsx
│   ├── concatenated_alignment.fasta
│   ├── Baye_single_28s.tre
│   ├── Baye_single_18s.tre
│   ├── Baye_final_concat.tre
│   ├── RAxML_single_28s.result
│   ├── RAxML_single_18s.result
│   └── RAxML_final_concat.result
│
└── stat_SP/
    ├── ALL_morhometry.R
    ├── cell_d.xlsx
    ├── vl_am_br_tu_hm.xlsx
    ├── tral_.xlsx
    └── ib_fusi.xlsx
```

### Data description

Appendix 4 contains information on the statistical and bioinformatic processing of data. A description of the data is given below.

#### `bioinf_SP` — bioinformatic processing

| File | Description |
|---|---|
| `28s_18s.xlsx` | A table with metadata on the sequences of the 18S and 28S rRNA genes used in the analysis. The table displays the names of sequences, source, biotope and geographic point from which the material was isolated, annotation, and directly the sequences themselves of the 18S and 28S rRNA genes. |
| `concatenated_alignment.fasta` | Concatenated alignment of sequences of the 18S and 28S rRNA genes. |
| `Baye_single_28s.tre` / `Baye_single_18s.tre` / `Baye_final_concat.tre` | Molecular phylogenetic trees constructed by the method of Bayesian analysis, respectively, based on sequences of the 28S rRNA gene, 18S rRNA gene, and concatenated alignment of 18S and 28S rRNA. |
| `RAxML_single_28s.result` / `RAxML_single_18s.result` / `RAxML_final_concat.result` | Molecular phylogenetic trees constructed by the method of maximum likelihood, respectively, based on sequences of the 28S rRNA gene, 18S rRNA gene, and concatenated alignment of 18S and 28S rRNA. |

#### `stat_SP` — statistical processing of data

| File | Description |
|---|---|
| `ALL_morhometry.R` | A script in the R programming language, in which the statistical analyses carried out in the course of the work are displayed. The script also contains code for constructing graphs. Necessary additional packages for the script to work: `readxl`, `dplyr`, `tidyr`, `stringr`, `ggplot2`, `ggpubr`, `openxlsx`, `tibble`. |
| `cell_d.xlsx` | Measurements of cell diameter for each strain studied in the course of the work. |
| `vl_am_br_tu_hm.xlsx` | Measurements of the length and width of plate scales of strains Tur, Vla, Amet, Bar, and HM-5Z. |
| `tral_.xlsx` | Measurements of the length and width of inner and outer scales of strain Tral. |
| `ib_fusi.xlsx` | Measurement of the length of fusiform scales of strain Ib. |


## R dependencies

The statistical analysis was performed using [R](https://www.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/).

The script requires the following R packages:

- [`readxl`](https://cran.r-project.org/package=readxl)
- [`dplyr`](https://cran.r-project.org/package=dplyr)
- [`tidyr`](https://cran.r-project.org/package=tidyr)
- [`stringr`](https://cran.r-project.org/package=stringr)
- [`ggplot2`](https://cran.r-project.org/package=ggplot2)
- [`ggpubr`](https://cran.r-project.org/package=ggpubr)
- [`openxlsx`](https://cran.r-project.org/package=openxlsx)
- [`tibble`](https://cran.r-project.org/package=tibble)
