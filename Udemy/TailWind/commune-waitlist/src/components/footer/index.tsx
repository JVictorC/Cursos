import React from 'react'
import Atlassian from '../../Images/Atlassian Icon.svg'
import Behance from '../../Images/Behance Icon.svg'
import Bing from '../../Images/Bing Icon.svg'
import Bitbucket from '../../Images/Bitbucket Icon.svg'
import Dropbox from '../../Images/Dropbox Icon.svg'
import Twitch from '../../Images/Twitch Icon.svg'
import Twitter from '../../Images/Twitter Icon.svg'



const compinies = [Atlassian, Behance,Bing, Bitbucket, Dropbox, Twitch, Twitter]

export default function Footer() {
  return (
    <footer className="md:my-20">
      <h3 className="text-xl font-semibold my-3 px-3">Used by the companies:</h3>
      <ul className="flex flex-wrap lg:my-10">
        {
          compinies.map((companie) => (
            <li key={companie} className='mr-5 mb-5'>
              <img src={companie} alt="Icon de empresa parceiras" />
            </li>
          ))
        }
      </ul>
    </footer>
  )
}
