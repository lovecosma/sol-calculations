export const calculateChart = async (chartData) => {
    let resp = await fetch('/api/charts',{
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(chartData)
    })
    let chart = await resp.json()
    debugger
}