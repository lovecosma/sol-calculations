import React from 'react'
import {NumberScreen} from "../components/NumberScreen";
import {HomeScreenTile} from "../components/HomeScreenTile";

export const Home = () => {
    return (
        <div className="flex justify-center">
            <div className="mt-8">
                <div className="flex justify-center">
                    <h1 className="text-4xl font-semibold">Welcome to Sol Calculations!</h1>
                </div>
                <p className="mt-4 flex justify-center" >Discover the meaning behind your name and birthday with our numerology calculator.</p>
                <div className="flex justify-center mt-4 mb-4">
                    <button className="w-52 h-12 border-brand-color font-medium">GET FREE REPORT</button>
                </div>
                <div>
                    <NumberScreen/>
                </div>
                <div className={'flex justify-between'}>
                    <HomeScreenTile header={"About Numerology"} buttonText={'LEARN MORE'}/>
                    <HomeScreenTile header={"Famous People’s Numerology"} buttonText={'SEE CHARTS'}/>
                    <HomeScreenTile header={"Events"} buttonText={'LEARN MORE'}/>
                </div>
            </div>
        </div>
    )
}