export default function Cart(props) {
  const {title, icon} = props
  return(
    <div className="services-card">
    <i className={icon}></i>
    <h3>{title}</h3>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At, non consequuntur. Adipisci provident numquam unde magni, laborum dolore eveniet nobis dolorem repudiandae eaque fugit a aut. Labore sequi inventore aut!</p>
  </div>
  )
}