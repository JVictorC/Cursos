const fetchCategorys = () => (
  fetch('https://api.mercadolibre.com/sites/MLB/categories')
  .then(response => response.json())
)

export default fetchCategorys;