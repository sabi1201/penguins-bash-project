mkdir -p data/processed
mkdir -p output

# copy raw data to processed
cp data/raw/penguins.csv data/processed/penguins_clean.csv

# Step 3: Clean the data a bit (remove blank lines and rows with ,,)
head -n 1 data/processed/penguins_clean.csv > data/processed/_tmp.csv
tail -n +2 data/processed/penguins_clean.csv | grep -v ",," >> data/processed/_tmp.csv
mv data/processed/_tmp.csv data/processed/penguins_clean.csv

# Step 4: Quick preview of the data
echo "First 5 lines of cleaned data:"
head -n 5 data/processed/penguins_clean.csv
echo ""
echo "Last 3 lines:"
tail -n 3 data/processed/penguins_clean.csv
echo ""

# Step 5: Count total rows
echo "Number of rows (including header):"
wc -l data/processed/penguins_clean.csv
echo ""

# Step 6: Count penguins by species (Adelie, Gentoo, Chinstrap)
echo "species,count" > output/species_counts.csv

for sp in Adelie Gentoo Chinstrap
do
  count=$(grep "^$sp," data/processed/penguins_clean.csv | wc -l)
  echo "$sp,$count" >> output/species_counts.csv
done

# Step 7: Show results on screen
echo "Species counts:"
cat output/species_counts.csv
echo ""

# Step 8: List project structure to output (show wildcards & redirection)
ls data/*/ > output/folder_list.txt
ls scripts/*.sh >> output/folder_list.txt

echo "All done! Outputs created in:"
echo "  data/processed/penguins_clean.csv"
echo "  output/species_counts.csv"
echo "  output/folder_list.txt"
