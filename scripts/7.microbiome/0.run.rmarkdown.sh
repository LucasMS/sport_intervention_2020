#Universal variables
FILENAME1='diversity'
FILENAME2='diff.abundance'
FILENAME3='summarize.results'
DIROUT='/home/lsilva/IKMB/projects/sport/analysis/25.to.publish/7.microbiome'
mkdir "$DIROUT" -p

# Run analysis for all groups
for GROUP in Strength Endurance Control
do
 for STAGE in intervention after
 do
  # Do diversity
  INPUT=${FILENAME1}'.Rmd'
  OUTPUT=${GROUP}'.'${FILENAME1}'.'${STAGE}'.html'
  FIGPATH=${DIROUT}'/'${GROUP}'.'${FILENAME1}'.'${STAGE}'/'

  R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', group = '${GROUP}', stage = '${STAGE}'))"

  # Do diff abundance

  INPUT=${FILENAME2}'.Rmd'
  OUTPUT=${GROUP}'.'${FILENAME2}'.'${STAGE}'.html'
  FIGPATH=${DIROUT}'/'${GROUP}'.'${FILENAME2}'.'${STAGE}'/'

  R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', group = '${GROUP}', stage = '${STAGE}'))"
 done
done

for STAGE in intervention after
do
 # Summarise the results
 INPUT=${FILENAME3}'.Rmd'
 OUTPUT=${FILENAME3}'.'${STAGE}'.html'
 FIGPATH=${DIROUT}'/'${FILENAME4}'.'${STAGE}'/'
 
 R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('${INPUT}', output_file='${DIROUT}/${OUTPUT}', params = list(FIGPATH='${FIGPATH}', d.out = '${DIROUT}', stage = '${STAGE}'))"
done
