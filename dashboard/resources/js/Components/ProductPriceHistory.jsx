import React from "react";
import ReactApexChart from "react-apexcharts";
import dayjs from "dayjs";
/* 
const ProductPriceHistory = () => {
    const options = {
        options: {
            chart: {
                height: 350,
                type: "line",
                zoom: {
                    enabled: false,
                },
            },
            dataLabels: {
                enabled: false,
            },
            stroke: {
                curve: "straight",
            },
            title: {
                text: "Product Trends by Month",
                align: "left",
            },
            grid: {
                row: {
                    colors: ["#f3f3f3", "transparent"], // takes an array which will be repeated on columns
                    opacity: 0.5,
                },
            },
            xaxis: {
                categories: [
                    "Jan",
                    "Feb",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                ],
            },
        },
    };
    const series = [
        {
            name: "Continente pt",
            data: [4.5, 4.3, 4.49, 4.25, 4.7, 4.6, 4.5],
        },
        {
            name: "Garrafeira Soares",
            data: [3.6, 3.5, 3.56, 3.6, 3.75, 3.48, 3.4],
        },
        {
            name: "El Corte Ingles",
            data: [4.2, 4.5, 4.49, 4.25, 4.55, 4.45, 4.23],
        },
    ];

    return <Chart options={options} series={series} type="area" />;
};

 */

class ProductPriceHistory extends React.Component {
    constructor(props) {
        super(props);

        // console.log("chart", this.props);
        this.state = {
            series: [
                {
                    name: "Continente pt",
                    data: this.props.history.continente,
                },
                {
                    name: "Garrafeira Soares",
                    data: this.props.history.soares,
                },
                {
                    name: "El Corte Ingles",
                    data: this.props.history.elcorte,
                },
            ],
            options: {
                chart: {
                    height: 350,
                    type: "line",
                    zoom: {
                        enabled: false,
                    },
                },
                dataLabels: {
                    enabled: false,
                },
                stroke: {
                    curve: "straight",
                },
                title: {
                    text: "Last Week",
                    align: "left",
                },
                grid: {
                    row: {
                        colors: ["#f3f3f3", "transparent"], // takes an array which will be repeated on columns
                        opacity: 0.5,
                    },
                },
                xaxis: {
                    categories: [
                        dayjs(this.props.lastWeek[6]).format("DD MMM"),
                        dayjs(this.props.lastWeek[5]).format("DD MMM"),
                        dayjs(this.props.lastWeek[4]).format("DD MMM"),
                        dayjs(this.props.lastWeek[3]).format("DD MMM"),
                        dayjs(this.props.lastWeek[2]).format("DD MMM"),
                        dayjs(this.props.lastWeek[1]).format("DD MMM"),
                        dayjs(this.props.lastWeek[0]).format("DD MMM"),
                    ],
                },
            },
        };
    }

    render() {
        return (
            <div id="chart">
                <ReactApexChart
                    options={this.state.options}
                    series={this.state.series}
                    type="line"
                    height={350}
                />
            </div>
        );
    }
}

export default ProductPriceHistory;
