import React from 'react'

export const HomeScreenTile = ({header, buttonText}) => {
    return (
        <div className={'w-1/3'}>
            <h1 className={'mt-8 mb-8 text-2xl flex justify-center font-semibold'}>{header}</h1>
            <div className={'flex justify-center'}>
                <button className={'border-brand-color w-36 h-10 font-medium'}>{buttonText}</button>
            </div>
        </div>
    )
}