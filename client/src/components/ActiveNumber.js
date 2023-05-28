export class ActiveNumber {
    constructor(x, y, angle, period, amp, number, size) {
        this.x = x
        this.y = y
        this.angle = angle
        this.period = period
        this.amp = amp
        this.number = number
        this.size = size
        this.alpha = 0
        this.c = {}
    }

    motion = (p5) => {
        p5.textSize(this.size)
        p5.fill(0)
        p5.text(`${this.number}`, this.x, this.y);
        this.y = p5.map(p5.sin(this.angle), -1, 1, 100, this.amp)
        if(this.x > 1000){
            this.x = -10
        }
        this.i = p5.TWO_PI / this.period
        this.angle += this.i
        this.x += 2;
    }

}