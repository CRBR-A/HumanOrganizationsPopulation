echo "" > "renameCountries.sh"

find . -type d -print0 | while read -d $'\0' fullfile
do
  # rename file
  path="${fullfile%/*}"
  file="${fullfile##*/}"
  filename="${file%.*}"
  
  #cp "$fullfile" "${filename}/travel-advisories.txt"
  #mv "$fullfile" "${filename}/travail-information.txt"
  # rename extension
  if [[ -f "${fullfile}/background.txt" ]]; then
    line=`grep "country: " "${fullfile}/background.txt"`
    countryName="${line#country: }"
    replaceCountry="${countryName// /-}"
    echo "mv ${fullfile#./} ${replaceCountry,,}" >> "renameCountries.sh"
  fi
done
