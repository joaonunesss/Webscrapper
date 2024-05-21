import React from "react";
import { IoTrendingUpOutline, IoTrendingDownOutline } from "react-icons/io5";
import { TfiLayoutLineSolid } from "react-icons/tfi";

function getLowestPrice(entries) {
    return Math.min(...entries.map((item) => item.price)).toFixed(2);
}

function getAveragePrice(entries) {
    let sum = 0;
    entries.forEach((item) => {
        sum += item.price;
    });
    return +(sum / entries.length).toFixed(2);
}

function buildClasses(percent) {
    if (percent > 0) return "bg-red-600 text-white text-xs rounded-full px-2";
    else if (percent < 0)
        return "bg-green-600 text-white text-xs rounded-full px-2";
    return "bg-gray-400 text-white text-xs rounded-full px-2";
}

function renderTrending(newPrice, oldPrice) {
    // newPrice = 4.99;
    // oldPrice = 6.99;
    let percentageChange = +(((newPrice - oldPrice) / oldPrice) * 100).toFixed(
        1
    );

    // ${Boolean(percentageChange < 0) && "bg-green-500"}

    return (
        <span className={buildClasses(percentageChange)}>
            {percentageChange > 0.0 && "+"}
            {typeof percentageChange === "number"
                ? percentageChange
                : +(0.0).toFixed(1)}
            %
        </span>
    );

    // if (newPrice < oldPrice)
    //     return <IoTrendingDownOutline className="text-green-600 text-3xl" />;
    // else if (newPrice > oldPrice)
    //     return <IoTrendingUpOutline className="text-red-600 text-3xl" />;
    // return <TfiLayoutLineSolid className="text-gray-400 text-xl" />;
}

export default function ProductStats({
    todaysPrices = [],
    yesterdaysPrices = [],
}) {
    if (!todaysPrices || !todaysPrices?.length) return;

    const lowestPrice = getLowestPrice(todaysPrices);
    const averagePrice = getAveragePrice(todaysPrices);

    const yesterdayLowestPrice = getLowestPrice(yesterdaysPrices);
    const yesterdayAveragePrice = getAveragePrice(yesterdaysPrices);

    console.log({ todaysPrices, yesterdaysPrices });

    return (
        <div>
            <h2 className="mb-4 font-semibold text-lg text-gray-800 leading-tight">
                Today's Stats
            </h2>
            <div className="flex">
                <div className="border border-gray-300 py-2 px-4 mr-3 rounded">
                    <div>
                        <p className="text-gray-600 text-sm">Lowest Price</p>
                        <div className="flex items-center">
                            <p className="text-2xl font-bold mr-2">
                                {lowestPrice}€
                            </p>
                            {renderTrending(lowestPrice, yesterdayLowestPrice)}
                        </div>
                    </div>
                </div>

                <div className="border border-gray-300 py-2 px-4 rounded">
                    <div>
                        <p className="text-gray-600 text-sm">Average Price</p>
                        <div className="flex items-center">
                            <p className="text-2xl font-bold mr-2">
                                {averagePrice.toFixed(2)}€
                            </p>
                            {renderTrending(
                                averagePrice,
                                yesterdayAveragePrice
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
