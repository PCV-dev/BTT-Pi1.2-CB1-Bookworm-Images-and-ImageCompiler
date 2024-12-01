#!/bin/bash

# Anzahl Dateien pro Batch
batch_size=999
counter=0
batch_number=1

# Iteriere über alle unversionierten Dateien
for file in $(git ls-files --others --exclude-standard); do
    git add "$file"
    counter=$((counter + 1))

    # Wenn Batch voll, committen
    if (( counter >= batch_size )); then
        git commit -m "Batch $batch_number"
        echo "Batch $batch_number commit completed."
        batch_number=$((batch_number + 1))
        counter=0
    fi
done

# Committe verbleibende Dateien
if (( counter > 0 )); then
    git commit -m "Batch $batch_number"
    echo "Final batch $batch_number commit completed."
fi

# Push alle Commits
git push

