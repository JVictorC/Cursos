export default function Job(props) {
  const { id, titleSection } = props
  return (
    <div className="job-card" id={id}>
      <div className="job-card-cover">
        <p className="jons-card-title">{titleSection}</p>
        <p className="job-card-description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi porro, quae corporis aperiam voluptates quasi aut eligendi ratione sed placeat laborum doloremque accusantium aliquid ad iste distinctio optio doloribus et.</p>
      </div>
    </div>
  );
}