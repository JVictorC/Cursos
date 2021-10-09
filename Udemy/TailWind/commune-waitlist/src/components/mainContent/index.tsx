import React from 'react';
import Illustration from '../../Images/Illustration.png'


const articleDescribe = 'flex flex-col items-center text-center  h-full w-80 m-auto md:w-full lg:flex-grow lg:items-baseline'

const formControl = 'flex flex-col md:flex-row md:w-full justify-center items-center lg:justify-start'

export default function MainContent() {
  return (
    <main className="h-4/6 mt-5">
      <section className="h-full flex">
        <article className={articleDescribe}>
          <p className="font-light text-white p-3 rounded-full bg-main mb-5 my-5">
            We are now allowing early-access for users.
            <span className="ml-3 underline font-semibold">Learn more.</span>
          </p>
          <article className="w-96 md:w-3/5 lg:w-full my-5">
          <h1 className="md:w-4/5 md:m-auto lg:text-left md:text-5xl lg:w-full">Build a highly engaged community with effort.</h1>
          <p className="text-xl my-5 lg:text-left">
            Commune offers the tools you need to build a highly engages
            community with litle to no effort. Simply setup your Commune
            workspace, and manage everything from members to contetn from one
            central dashboard
          </p>
          </article>
        <form className={formControl}>
          <input type="text" placeholder="Entrer your e-mail address" className="pl-5 py-5 border rounded w-96" />
          <button type="button" className="btn btn-primary md:ml-5">Join Waitlist</button>
        </form>
        </article>
        <img src={Illustration} alt="ilustração de cores" className="hidden lg:block lg:w-3/5 h-96" />
      </section>
    </main>
  );
}
