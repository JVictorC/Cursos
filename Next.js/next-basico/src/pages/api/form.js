const usuarios = [];

export default function form(req, res) {
  if (req.method === 'POST') {
    post(req, res)
  } else if (req.method === 'GET') {
    get(req, res)
  } else {
    return res.status(405).send()
  }
}

function post(req, res) {
  const newUser = req.body;

  usuarios.push(newUser.body);

  return res.status('200').send();
}

function get(req, res) {
  return res.status(200).json(usuarios)

}