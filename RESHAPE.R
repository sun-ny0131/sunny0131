# Reload the dataset with correct encoding
df <- readr::read_csv("歷年中華民國國民出國目的地人數統計2002-2024.csv", locale = readr::locale(encoding = "UTF-8"))

# Convert column names to character before pivoting
df_long <- df |>
  dplyr::mutate(across(-c(首站抵達地, 細分), as.character)) |>  # Ensure all year columns are character
  tidyr::pivot_longer(
    cols = -c(首站抵達地, 細分),
    names_to = "year",
    values_to = "travelers"
  ) |>
  dplyr::mutate(
    year = as.integer(year), 
    travelers = readr::parse_number(travelers) # Convert travelers to numeric
  )

# View the reshaped data
print(df_long)



