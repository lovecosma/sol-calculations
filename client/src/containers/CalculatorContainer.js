import React, {useState} from 'react'
import {Calculator} from "../components/Calculator";
import {calculateChart} from "../actions/chart";

export const CalculatorContainer = () => {
    const [formData, setFormData] = useState({
        firstName: null,
        middleName: null,
        lastName: null,
        birthDate: null
    })

    const onChange = (e) => {
        e.preventDefault()
        setFormData(prevState => {
            return {
                ...prevState,
                [e.target.name]: e.target.value
            }
        })
    }

    const onSubmit = async (e) => {
        e.preventDefault()
        await calculateChart(formData)
        debugger
    }

    return (
        <div className={'flex justify-center'}>
            <Calculator onChange={onChange} onSubmit={onSubmit} formData={formData} />
        </div>
    )
}