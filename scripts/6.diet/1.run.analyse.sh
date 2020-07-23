#Universal variables
FILENAME1='analyse.data'
FILENAME2='summarize.results'
FILENAME3="make.final.plots"
DIROUT='/home/lsilva/IKMB/projects/sport/analysis/25.to.publish/6.diet'
mkdir "$DIROUT" -p

# Run analysis for all groups
for GROUP in Strength Endurance Control
do
# Do analysis
INPUT=${FILENAME1}'.Rmd'
OUTPUT=${GROUP}'.'${FILENAME1}'.intervention.html'
FIGPATH=${DIROUT}'/'${GROUP}'.'${FILENAME1}'.intervention/'

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', group = '${GROUP}', stage = 'intervention'))"

# Do analysis
INPUT=${FILENAME1}'.Rmd'
OUTPUT=${GROUP}'.'${FILENAME1}'.after.html'
FIGPATH=${DIROUT}'/'${GROUP}'.'${FILENAME1}'.after/'

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', group = '${GROUP}', stage = 'after'))"

done

# Summarise the results intervention
INPUT=${FILENAME2}'.Rmd'
OUTPUT=${FILENAME2}'.intervention.html'
FIGPATH=${DIROUT}'/'${FILENAME2}'.intervention/'

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', stage = 'intervention'))"

INPUT=${FILENAME2}'.Rmd'
OUTPUT=${FILENAME2}'.after.html'
FIGPATH=${DIROUT}'/'${FILENAME2}'.after/'

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', stage = 'after'))"



# Make final plots
INPUT=${FILENAME3}'.Rmd'
OUTPUT=${FILENAME3}'.html'
FIGPATH=${DIROUT}'/'${FILENAME3}'/'

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}'))"
