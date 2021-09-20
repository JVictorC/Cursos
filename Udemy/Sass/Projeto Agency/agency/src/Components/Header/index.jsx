function Header () {
  return(
    <header id="main-banner">
      <div className="nav-container">
        <a href="/" className="brand">
          <i className="fas fa-brain"></i> Agency
        </a>
        <nav>
          <ul className="nav-container-navbar">
            <li>
              <a href="/"> Home </a>
            </li>
            <li>
              <a href="/"> Serviços </a>
            </li>
            <li>
              <a href="/"> Contatos </a>
            </li>
            <li>
              <a href="/" className="btn btn-primary"> Entrar </a>
            </li>
            <li>
              <a href="/" className="btn"> Registrar </a>
            </li>
          </ul>
        </nav>
        <i className="fas fa-bars"></i>
        </div>
        <div className="title-container">
          <h2>Nos desenvolvemos</h2>
          <h1>Proderosas Experiencias</h1>
          <a href="/" className="btn btn-primary btn-rounded">
            Fazer Orçamento
          </a>
          </div>    
    </header>
  )
}

export default Header