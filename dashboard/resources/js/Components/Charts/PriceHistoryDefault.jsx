import React from "react";
import ReactApexChart from "react-apexcharts";
import dayjs from "dayjs";
import relativeTime from "dayjs/plugin/relativeTime";
import { Container } from "postcss";

dayjs.extend(relativeTime);

const lastWeek = [
    dayjs().subtract(6, "day"),
    dayjs().subtract(5, "day"),
    dayjs().subtract(4, "day"),
    dayjs().subtract(3, "day"),
    dayjs().subtract(2, "day"),
    dayjs().subtract(1, "day"),
    dayjs().subtract(0, "day"),
];

function groupPricesByDate(records) {
    let res = [];
    // console.log("history", history);
    lastWeek.forEach((date, i) => {
        // console.log("processing date", date);
        let entries = records?.filter((el) =>
            dayjs(date).isSame(el.updated_at, "day")
        );
        res[i] = entries ? entries : null;
    });
    // console.log("res", res);
    return res;
}

function getMinPrices(arr) {
    return arr?.map((day) => {
        if (!day?.length) {
            return null;
        }
        let min = day[0].price;
        day.forEach((entry) => {
            if (entry.price < min) min = entry.price;
        });
        // console.log({ c: +min.toFixed(2) });
        return +min.toFixed(2);

        // const minPrice = Math.min(...day.map((entry) => entry.price));
        // if (minPrice == Infinity) return null;
        // return minPrice;
    });
}

function getMaxPrices(arr) {
    return arr?.map((day) => {
        const minPrice = Math.max(...day.map((entry) => entry.price));
        if (minPrice == -Infinity) return null;
        return +minPrice.toFixed(2);
    });
}

function getAvgPrices(arr) {
    return arr?.map((day) => {
        const sum = day?.reduce(
            (accumulator, currentValue) => accumulator + currentValue.price,
            0
        );

        if (sum == 0) return null;
        // console.log("sum for day", sum);
        return +(sum / day.length).toFixed(2);
    });
}

function fillData(data) {
    const chartData = [
        {
            name: "min price",
            data: getMinPrices(data),
        },
        {
            name: "avg price",
            data: getAvgPrices(data),
        },
        {
            name: "max price",
            data: getMaxPrices(data),
        },
    ];
    // console.log({ chartData });

    return chartData;
}

function getMaxForTheWeek(week) {
    const minPrice = Math.max(...week.map((entry) => entry));
    if (minPrice == -Infinity) return null;
    return minPrice;
}

function getMinForTheWeek(week) {
    let min = Number.MAX_VALUE;
    week.forEach((value) => {
        if (typeof value == "number" && value < min) min = value;
    });
    if (min == 1.7976931348623157e308) return null;
    return min;
}

function PriceHistoryDefault({ history }) {
    const groupedEntries = groupPricesByDate(history);
    const chartData = fillData(groupedEntries);

    const maximum = getMaxForTheWeek(chartData[2]?.data);
    const minimum = getMinForTheWeek(chartData[0]?.data);

    console.log({ chartData, groupedEntries, maximum, minimum });

    return (
        <>
            <DefaultChart
                data={chartData}
                minimum={minimum}
                maximum={maximum}
                lastWeek={lastWeek}
            />
        </>
    );
}

class DefaultChart extends React.Component {
    constructor(props) {
        super(props);

        // console.log("chart", this.props);
        this.state = {
            series: this.props.data,
            // options: {
            //     chart: {
            //         height: 350,
            //         type: "line",
            //         zoom: {
            //             enabled: false,
            //         },
            //     },
            //     dataLabels: {
            //         enabled: false,
            //     },
            //     stroke: {
            //         curve: "straight",
            //     },
            //     title: {
            //         text: "Last Week",
            //         align: "left",
            //     },
            //     grid: {
            //         row: {
            //             colors: ["#f3f3f3", "transparent"], // takes an array which will be repeated on columns
            //             opacity: 0.5,
            //         },
            //     },
            //     xaxis: {
            //         categories: [
            //             dayjs(this.props.lastWeek[6]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[5]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[4]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[3]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[2]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[1]).format("DD MMM"),
            //             dayjs(this.props.lastWeek[0]).format("DD MMM"),
            //         ],
            //     },
            // },
            options: {
                chart: {
                    height: 350,
                    type: "bar",
                    zoom: {
                        enabled: false,
                    },
                },
                title: {
                    text: "Last Week",
                    align: "left",
                    style: {
                        fontSize: "20px",
                        fontWeight: "bold",
                    },
                },
                yaxis: {
                    min: this.props.minimum * 0.999,
                    max: this.props.maximum * 1.001,
                },
                xaxis: {
                    categories: [
                        dayjs(this.props.lastWeek[0]).format("DD MMM"),
                        dayjs(this.props.lastWeek[1]).format("DD MMM"),
                        dayjs(this.props.lastWeek[2]).format("DD MMM"),
                        dayjs(this.props.lastWeek[3]).format("DD MMM"),
                        dayjs(this.props.lastWeek[4]).format("DD MMM"),
                        dayjs(this.props.lastWeek[5]).format("DD MMM"),
                        dayjs(this.props.lastWeek[6]).format("DD MMM"),
                    ],
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        dataLabels: {
                            position: "top",
                        },
                    },
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

export default PriceHistoryDefault;
