import React from 'react'

export const CalculatorInput = ({label, type, onChange, name, formData, required, pattern}) => {
    return (
        <div>
            <label className={'mr-6'}>{label}</label>
            <input onChange={onChange}
                   name={name}
                   className={'name-input border border-black p-4'}
                   type={type}
                   value={formData[name]}
                   required={required}
                   pattern={pattern}
            />
        </div>
    )
}