import React, {useState} from 'react'
import {CalculatorInput} from "./CalculatorInput";
import {BrandButton} from "./BrandButton";

export const Calculator = ({onChange, onSubmit, formData}) => {

    return (
        <div>
            <div className={'calculator-container mt-40 border border-black'}>
                <div className={'w-full flex justify-center h-12 pt-2 border-b border-black'}>
                    <h1 className={'text-2xl font-semibold'}>Free Numerology Calculator</h1>
                </div>
                <form className={'mt-16'} onSubmit={onSubmit}>
                   <div className={'flex justify-evenly mt-10'}>
                       <CalculatorInput
                           label={'First Name:'}
                           type={'text'}
                           name='firstName'
                           onChange={onChange}
                           formData={formData}
                           required={true}
                       />
                       <CalculatorInput
                           label={'Middle Name:'}
                           type={'text'}
                           name='middleName'
                           onChange={onChange}
                           formData={formData}
                       />
                   </div>
                    <div className={'flex justify-evenly mt-10'} >
                        <CalculatorInput
                            label={'Last Name:'}
                            type={'text'} name='lastName'
                            onChange={onChange}
                            formData={formData}
                            required={true}
                        />
                        <CalculatorInput
                            label={'Date of Birth:'}
                            type={'date'}
                            name={'birthDate'}
                            onChange={onChange}
                            formData={formData}
                            required={true}
                        />
                    </div>
                    <div className={'flex justify-center mt-14'}>
                        <BrandButton type="submit" buttonText={'CALCULATE'}/>
                    </div>
                </form>
            </div>
        </div>
    )
}