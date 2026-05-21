# RU // EN

## Биоинформатические и статистические данные в магистерской работе на тему "Филогения, систематика и эволюция Raphidocystis-подобных центрохелидных солнечников (Haptista: Centroplasthelida)"
## Структура репозитория 
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

# Приложение 4 содержит информацию о статистической и биоинформатической обработке данных. Ниже дано описание данных.  
1.	bioinf_SP – Биоинформатическая обработка:
  1.	28s_18s.xlsx – Таблица с метаданными по последовательностям генов 18S и 28S рРНК, использованных в анализе. В таблице отображены названия последовательностей, источник, биотоп и географическая точка из которых изолирован материал, аннотация и непосредственно сами последовательности генов 18S и 28S рРНК;
  2.	concatenated_alignment.fasta – конкатенированное выравнивание последовательностей генов 18S и 28S рРНК;
  3.	Baye_single_28s.tre / Baye_single_18s.tre / Baye_final_concat.tre – молекулярно-филогенетические деревья, построенные методом байесовского анализа, соответственно, на основе последовательностей гена 28S рРНК, 18S рРНК и конкатенированного выравнивания 18S и 28S рРНК;
  4.	RAxML_single_28s.result / RAxML_single_18s.result / RAxML_final_concat.result – молекулярно-филогенетические деревья, построенные методом максимального правдоподобия, соответственно, на основе последовательностей гена 28S рРНК, 18S рРНК и конкатенированного выравнивания 18S и 28S рРНК.
2.	stat_SP – статистическая обработка данных:
  1.	ALL_morhometry.R – скрипт на языке программирования R, в котором отображены статистические анализы, проведенные в ходе работы. Также скрипт содержит код для построения графиков. Необходимые дополнительные пакеты для работы скрипта: readxl, dplyr, tidyr, stringr, ggplot2, ggpubr, openxlsx, tibble; 
  2.	cell_d.xlsx – измерения диаметра клетки для каждого штамма, изученного в ходе работы; 
  3.	vl_am_br_tu_hm.xlsx – измерения длины и ширины пластинчатых чешуек штаммов Tur, Vla, Amet, Bar и HM-5Z;
  4.	tral_.xlsx – измерения длины и ширины внутренних и внешних чешуек штамма Tral;
  5.	ib_fusi.xlsx – измерение длины веретеновидных чешуек штамма Ib.

## Bioinformatic and statistical data for master's thesis “Phylogeny, systematics, and evolution of Raphidocystis-like centrohelid heliozoans (Haptista: Centroplasthelida)”

## Repository structure
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
# Appendix 4 contains information on the statistical and bioinformatic processing of data. A description of the data is given below.

1. bioinf_SP – Bioinformatic processing:
   1. 28s_18s.xlsx – A table with metadata on the sequences of the 18S and 28S rRNA genes used in the analysis. The table displays the names of sequences, source, biotope and geographic point from which the material was isolated, annotation, and directly the sequences themselves of the 18S and 28S rRNA genes;
   2. concatenated_alignment.fasta – concatenated alignment of sequences of the 18S and 28S rRNA genes;
   3. Baye_single_28s.tre / Baye_single_18s.tre / Baye_final_concat.tre – molecular phylogenetic trees constructed by the method of Bayesian analysis, respectively, based on sequences of the 28S rRNA gene, 18S rRNA gene, and concatenated alignment of 18S and 28S rRNA;
   4. RAxML_single_28s.result / RAxML_single_18s.result / RAxML_final_concat.result – molecular phylogenetic trees constructed by the method of maximum likelihood, respectively, based on sequences of the 28S rRNA gene, 18S rRNA gene, and concatenated alignment of 18S and 28S rRNA.

2. stat_SP – statistical processing of data:
   1. ALL_morhometry.R – a script in the R programming language, in which the statistical analyses carried out in the course of the work are displayed. The script also contains code for constructing graphs. Necessary additional packages for the script to work: readxl, dplyr, tidyr, stringr, ggplot2, ggpubr, openxlsx, tibble;
   2. cell_d.xlsx – measurements of cell diameter for each strain studied in the course of the work;
   3. vl_am_br_tu_hm.xlsx – measurements of the length and width of plate scales of strains Tur, Vla, Amet, Bar, and HM-5Z;
   4. tral_.xlsx – measurements of the length and width of inner and outer scales of strain Tral;
   5. ib_fusi.xlsx – measurement of the length of fusiform scales of strain Ib.
