import React from 'react';
import Checkmark from '../../Images/Checkmark.svg';
import ShapeBlue from '../../Images/Blue Shape.svg'
import ShapePink  from '../../Images/Pink Shape.svg'
import ShapePurple from '../../Images/Purple Shape.svg'
import HeroImage from '../../Images/Hero Image (Model).png'

export default function ContainerMain() {
  return (
    <div className="main-container-page">
      <section className="container-hero">
        <h1 className="text-4xl text-black text-center lg:text-left my-5">Host Your WebSite in less than 5 minutes.</h1>
        <p className="font-normal my-5">
          With Hoster, get your website up and running in no less than 5 minutes
          with the mostt competitive pricing pakages available online
        </p>
        <form>
          <input type="text" className="py-3 text-left pl-5 pr-10 rounded mr-5 mb-3 w-full lg:w-auto" placeholder="Entre e-mail address" />
          <button className="btn btn-primary">Joint waitlist</button>
        </form>
        <span className="flex mt-3">
          <img src={Checkmark} alt="check green " />
          <p className="mx-3 font-normal">No spam, ever. unsubcribe anytime</p>
        </span>
      </section>

      <div className="container-images">

        <img src={ShapeBlue} alt="shape color Blue"
        className="images transform -rotate-45" />
        <img src={ShapePink} alt="shape color Pink"
        className="images transform -rotate-30" />
        <img src={ShapePurple} alt="shape color Purple"
        className="images transform -rotate-15" />
        <img src={HeroImage} alt="shape color Purple"
        className="images" />
      </div>
    </div>
  );
}
