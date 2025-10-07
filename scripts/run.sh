mkdir -p data/processed
mkdir -p output

# copy raw data to processed
cp data/raw/penguins.csv data/processed/penguins_clean.csv

# print first few lines to the screen
echo "Here are the first lines of the data:"
head -n 5 data/processed/penguins_clean.csv
echo ""

# create a results file
echo "Species,Count" > output/penguin_counts.csv

# list of species to count
for species in Adelie Gentoo Chinstrap
do
    echo "Counting $species penguins..."
    count=$(grep "$species" data/processed/penguins_clean.csv | wc -l)
    echo "$species,$count" >> output/penguin_counts.csv
done

echo ""
echo "Done! Results saved to output/penguin_counts.csv"
echo "You can open it using: less output/penguin_counts.csv"
