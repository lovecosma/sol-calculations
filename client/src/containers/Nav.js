import React from 'react'
import logo from '../assets/logo.svg'
import { NavLink } from 'react-router-dom'
export const Nav = () => {
    return (
        <div className="w-full h-20 border-b border-black nav-font">
            <div className="py-2 px-16 flex justify-between">
                <NavLink to={"/"}><img className='' src={logo} /></NavLink>
                <div className="flex justify-between w-[32rem] text-xl mt-4 mr-6" >
                    <NavLink to={"learn"}><p>Learn</p></NavLink>
                    <NavLink to={"calculator"} ><p>Calculator</p></NavLink>
                    <NavLink to={"about"} ><p>About Us</p></NavLink>
                    <NavLink to={"account"} ><p>Account</p></NavLink>
                </div>
            </div>
        </div>
    )
}