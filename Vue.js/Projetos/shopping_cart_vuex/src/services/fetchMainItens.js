const fetchItensByName = (item) => (
  fetch(`https://api.mercadolibre.com/sites/MLB/search?q=${item}`)
  .then((response) => 
  response
  .json()
  .then((json) => (response.ok ? Promise.resolve(json) : Promise.reject(json)))
  )
)

export default fetchItensByName