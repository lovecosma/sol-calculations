import React from "react";
import Sketch from "react-p5";
import {ActiveNumber} from "./ActiveNumber";

let screenWidth = 1000
const NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 22, 33]
let movingNumbers = []
export const NumberScreen = () => {
    const setup = (p5, canvasParentRef) => {

        p5.createCanvas(screenWidth, 500).parent(canvasParentRef);
        NUMBERS.forEach((num) => {
            let x = p5.random(0, screenWidth)
            let y = p5.random(50, 500)
            let angle = p5.random(0, 360);
            let period = p5.random(1000, 3000)
            let amp = p5.random(100, 500)
            let size = p5.random(14, 40)
            movingNumbers.push(new ActiveNumber(x, y, angle, period, amp, num, size))
        })

    };

    const draw = (p5) => {
        p5.background('#F1F1F1');
        movingNumbers.forEach((num) => {
            num.motion(p5)
        })
    };

    return <Sketch setup={setup} draw={draw} />;
};
