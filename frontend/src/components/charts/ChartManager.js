import { Chart } from 'vue-charts';

class ChartManager extends Chart {

    mounted()
    {
       const data = [{
            workingTimes: { start: '2021-10-29 10:27:30', end: '2021-10-29 10:50:10'},
        }];

        this.renderChart(data);
    }
}

export default new ChartManager();