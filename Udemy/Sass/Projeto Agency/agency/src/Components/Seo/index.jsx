import Job from './Components/Job/Job'
import FirtsJob from './Components/Firts/FirtsJob'

export default function Seo() {
  return (
    <div className="jobs-container">
      <h2>Alguns de nossos trabalhos</h2>
      <div className="jobs-list">
        <FirtsJob />
        <div className="others-jobs-container">
        <Job id="job2" titleSection="Projeto 2"/>
        <Job id="job3" titleSection="Projeto 3"/>
        <Job id="job4" titleSection="Projeto 4"/>
        <Job id="job5" titleSection="Projeto 5"/>
        </div>
      </div>
    </div>
  )
}