DIROUT='/home/lsilva/IKMB/projects/sport/analysis/25.to.publish/10.figures'
mkdir "$DIROUT"

for FILENAME in fig1 fig2 fig3 fig4 fig5
do
 INPUT=${FILENAME}'.Rmd'
 OUTPUT=${FILENAME}'.html'
 FIGPATH=${DIROUT}'/'${FILENAME}'/'
 R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}'))"
done
