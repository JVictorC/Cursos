const fetchItensByName = (item) => (
  fetch(`https://api.mercadolibre.com/sites/MLB/search?q=$${item}`)
  .then(response => response.json())
)

export default fetchItensByName;