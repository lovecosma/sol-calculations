import React from 'react'

export const BrandButton = ({buttonText, type}) => {
    return (
        <div>
            <button type={type} className={'border-brand-color px-4 py-2'}>
                {buttonText}
            </button>
        </div>
    )
}