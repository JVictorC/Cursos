import Link from './Links/Link'

export default function Footer() {
  return(
    <footer>
      <div className="footer-container">
        <div className="footer-desc-container">
          <h3 className="footer-title">Agency</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic, tempora? Tempore, doloremque. Tempore saepe eaque doloremque sequi ad, voluptatem aut deleniti, corrupti a, odio odit itaque nihil aliquam iure expedita?</p>
        </div>
        <div className="footer-links-container">
          <Link />
          <Link />
          <Link />
        </div>
      </div>
      <div className="footer-copy-right-container">
        <p>&copy; 2021 Agency</p>
        <p>A melhor agencia para o seu projeto</p>
      </div>
    </footer>
  );
}