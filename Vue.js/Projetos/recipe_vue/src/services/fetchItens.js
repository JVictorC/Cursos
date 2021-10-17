export const fetchMealsItens = () => (
  fetch('https://www.themealdb.com/api/json/v1/1/search.php?s')
  .then((response) => response.json() )
);

export const fetchDrinksItens = () => (
  fetch('https://www.thecocktaildb.com/api/json/v1/1/search.php?s')
  .then((response) => response.json() )
)