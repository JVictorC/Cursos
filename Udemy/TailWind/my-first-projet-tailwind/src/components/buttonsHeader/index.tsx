import React from 'react';


function ButtonsHeader() {
  return (
    <section className="hidden lg:flex lg:w-1/4 lg:justify-evenly">
      <button type="button" className="btn">
        Sign in
      </button>
      <button type="button" className="btn btn-primary">
        Join WaitList
      </button>
    </section>
  );
}

export default ButtonsHeader