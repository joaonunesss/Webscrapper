import React, { useState } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import PrimaryButton from "@/Components/PrimaryButton";
import SecondaryButton from "@/Components/SecondaryButton";
import { useForm, Head, router, Link } from "@inertiajs/react";
import Tab from "@/Components/Tab";
import ProductPriceHistory from "@/Components/ProductPriceHistory";
import dayjs from "dayjs";
import relativeTime from "dayjs/plugin/relativeTime";
import ProductStats from "@/Components/ProductStats";
import PriceHistoryDefault from "@/Components/Charts/PriceHistoryDefault";
import YearsNavigation from "@/Components/YearsNavigation";

// dayjs.extend(relativeTime);

// const lastWeek = [
//     dayjs().subtract(0, "day"),
//     dayjs().subtract(1, "day"),
//     dayjs().subtract(2, "day"),
//     dayjs().subtract(3, "day"),
//     dayjs().subtract(4, "day"),
//     dayjs().subtract(5, "day"),
//     dayjs().subtract(6, "day"),
// ];

// function getPriceInDate(records, storeName) {
//     const res = [];

//     lastWeek.forEach((date) => {
//         let item = records?.find((el) => {
//             if (
//                 el.store_name == storeName &&
//                 dayjs(date).isSame(el.updated_at, "day")
//             )
//                 return 1;
//             return 0;
//         });

//         if (item) res.push(item.price);
//         else res.push(0);
//     });

//     return res;
// }

// function fillData(data) {
//     // console.log({ data });

//     const realdata = {
//         continente: getPriceInDate(data, "Continente"),
//         soares: getPriceInDate(data, "Garrafeira Soares"),
//         elcorte: getPriceInDate(data, "El Corte Ingles"),
//     };
//     // console.log({ realdata });

//     return realdata;
// }

export default function Edit({
    auth,
    product,
    today,
    yesterday,
    history,
    years,
}) {
    const [currentTab, setCurrentTab] = useState(0);

    // In case the Scrapper hasn't ran yet, make today's results equal to yesterday's
    if (!today?.length) today = yesterday;

    // console.log({ product, yesterday, today, history });

    // const realdata = fillData(history?.product_entries);

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <>
                    <SecondaryButton
                        type="button"
                        className="mb-6"
                        onClick={() => window.history.back()}
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            strokeWidth={1.5}
                            stroke="currentColor"
                            className="w-4 h-4 mr-1"
                        >
                            <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                d="M19.5 12h-15m0 0l6.75 6.75M4.5 12l6.75-6.75"
                            />
                        </svg>
                        Back
                    </SecondaryButton>
                    <div className="flex justify-between">
                        <div className="flex mb-6">
                            <img className="max-h-32" src={product.img} />
                            <div>
                                <h2 className="mb-4 font-semibold text-xl text-gray-800 leading-tight">
                                    {product.name}
                                </h2>

                                <p className="text-sm mb-0.5">
                                    <strong>EAN:</strong> {product.id}
                                </p>
                                <p className="text-sm mb-0.5">
                                    <strong>Brand:</strong> {product.brand}
                                </p>
                                {product.sub_brand && (
                                    <p className="text-sm mb-0.5">
                                        <strong>Alternative Name:</strong>{" "}
                                        {product.sub_brand}
                                    </p>
                                )}
                                <p className="text-sm mb-0.5">
                                    <strong>Capacity:</strong>{" "}
                                    {product.capacity}ml
                                </p>
                            </div>
                        </div>
                        <ProductStats
                            todaysPrices={today}
                            yesterdaysPrices={yesterday}
                        />
                    </div>
                    <div className="ml-10 mb-6 mt-2">
                        <YearsNavigation availableYears={years} />
                    </div>
                    <div
                        style={{ marginBottom: -24 }}
                        className="space-x-8 sm:-my-px sm:ml-10 sm:flex"
                    >
                        <Tab
                            active={currentTab == 0}
                            onClick={() => setCurrentTab(0)}
                        >
                            Offers
                        </Tab>
                        <Tab
                            active={currentTab == 1}
                            onClick={() => setCurrentTab(1)}
                        >
                            Prices History
                        </Tab>
                    </div>
                </>
            }
        >
            <Head title={product.name} />

            <div className="py-12 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                {currentTab == 0 && (
                    <>
                        <h3 className="text-xl mb-4 font-medium text-gray-900">
                            Offers
                        </h3>
                        {today.length ? (
                            today?.map((entry) => (
                                <div
                                    key={entry.id}
                                    className="flex items-center p-4 mb-3 sm:p-8 bg-white shadow rounded-lg"
                                >
                                    <img
                                        src={entry?.store?.logo_url}
                                        alt={entry.store_name}
                                        className="w-32 h-10 mr-6 object-contain"
                                    />
                                    <h3 className="text-lg font-medium mr-auto text-gray-900">
                                        {entry.product_name}
                                    </h3>

                                    {Boolean(entry.discount) && (
                                        <div class="mr-4 center relative inline-block select-none whitespace-nowrap rounded-lg bg-red-500 py-1 px-3.5 align-baseline font-sans text-xs font-bold uppercase leading-none text-white">
                                            <div class="mt-px">Sale</div>
                                        </div>
                                    )}

                                    <div className="text-right">
                                        <p className="text-2xl font-bold">
                                            {entry.price.toFixed(2)}

                                            {entry.currency == "EUR"
                                                ? "€"
                                                : "€"}
                                        </p>
                                        <p className="text-xs">
                                            {dayjs(entry.updated_at).fromNow()}
                                        </p>
                                    </div>

                                    <a
                                        href={entry.url}
                                        target="_blank"
                                        className="ml-4"
                                    >
                                        <SecondaryButton className="">
                                            Visit Store
                                        </SecondaryButton>
                                    </a>
                                </div>
                            ))
                        ) : (
                            <p>No offers at this moment.</p>
                        )}
                    </>
                )}
                {currentTab == 1 && (
                    <PriceHistoryDefault history={history} />
                    // <ProductPriceHistory
                    //     history={realdata}
                    //     lastWeek={lastWeek}
                    // />
                )}
            </div>
        </AuthenticatedLayout>
    );
}
