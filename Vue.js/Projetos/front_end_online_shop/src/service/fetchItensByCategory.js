const fetchItensByCategory = (category) => (
  fetch(`https://api.mercadolibre.com/sites/MLB/search?category=${category}`)
  .then(response => response.json())
)

export default fetchItensByCategory;