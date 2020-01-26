function main(params) {
    let name = params.name || "FastStart 2020"
    let place = params.place || "Vienna"
    return {payload:  'Hello, ' + name + ' from ' + place};
}