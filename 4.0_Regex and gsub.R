
#The sentence might be helpful in distinguishing various syntaxes of regex.
gsub("([fat])", "\\1_\\1_", "The fat Fart fad the food with Fat")
gsub("(fat)", "\\1_\\1_", "The fat Fart fad the food with Fat")
