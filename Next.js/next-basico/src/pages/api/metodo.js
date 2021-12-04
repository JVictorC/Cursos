const metodo = (req, res) => {
  res.status(200).json(
    {
      "metodo": req.method
    }
  )
};

export default metodo;