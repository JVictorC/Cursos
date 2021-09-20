import Cart from './Components/Cart'

export default function Main () {
  return(
    <main className="services-container">
      <h2>O que fazemos</h2>
      <div className="sevices-card-container">
      <Cart title="Desenvolvimento Full Stack" icon="fab fa-buffer" />
      <Cart title="Sites leves e Rapidos" icon="fas fa-bolt" />
      <Cart title="E-commerces" icon="fas fa-cart-plus" />
      <Cart title="SEO"  icon="fas fa-chart-line" />
      <Cart title="Estratégias de Markentig"  icon="fas fa-chess-pawn" />
      <Cart title="Hospedagem em Nuvem"  icon="fas fa-cloud" />
      </div>
      <a href="/" className="btn btn-primary btn-rounded">Vejo todos os Serviços</a>
    </main>
  );
}