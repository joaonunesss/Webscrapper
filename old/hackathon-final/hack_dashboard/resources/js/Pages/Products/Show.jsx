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

dayjs.extend(relativeTime);

const continenteLogo =
    "https://www.continente.pt/on/demandware.static/-/Sites-global-navigation-catalog/default/dwacb0abd8/images/brand-logos/LogoCOL.svg";
const garrafeiraSoaresLogo =
    "https://www.valedolobo.com/upload/media/cache/a2c8a26c8eaf4c2ba830cee89a8f42fd_logos.png";
const elCorteInglesLogo =
    "https://www.elcorteingles.es/recursos/informacioncorporativa/doc/portal/2017/07/06/eci-letras.png";

function getStoreImg(store) {
    if (store === "Continente") return continenteLogo;
    if (store === "Garrafeira Soares") return garrafeiraSoaresLogo;
    if (store === "El Corte Inglés") return elCorteInglesLogo;
}

const lastWeek = [
    dayjs().subtract(6, "day"),
    dayjs().subtract(5, "day"),
    dayjs().subtract(4, "day"),
    dayjs().subtract(3, "day"),
    dayjs().subtract(2, "day"),
    dayjs().subtract(1, "day"),
    dayjs().subtract(0, "day"),
];

function getPriceInDate(records, storeName) {
    const res = [];

    lastWeek.forEach((date) => {
        let item = records.find((el) => {
            if (
                el.store_name == storeName &&
                dayjs(date).isSame(el.created_at, "day")
            )
                return 1;
            return 0;
        });

        if (item) res.push(item.price);
        else res.push(0);
    });

    return res;
}

function fillData(data) {
    console.log({ data });

    const realdata = {
        continente: getPriceInDate(data, "Continente"),
        soares: getPriceInDate(data, "Garrafeira Soares"),
        elcorte: getPriceInDate(data, "El Corte Ingles"),
    };
    console.log({ realdata });

    return realdata;
}

export default function Edit({ auth, product, history }) {
    const [tabValue, setTabValue] = useState(0);
    const [currentTab, setCurrentTab] = useState(0);

    const uniqueOffers = product.product_entries.filter(
        (value, index, self) => {
            return (
                self.findIndex((v) => v.store_name === value.store_name) ===
                index
            );
        }
    );

    const realdata = fillData(history.product_entries);

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
                    <div className="flex mb-6">
                        <img className="max-h-32" src={product.img} />
                        <div>
                            <h2 className="mb-4 font-semibold text-xl text-gray-800 leading-tight">
                                {product.name}
                            </h2>

                            <p className="text-sm">
                                <strong>EAN:</strong> {product.id}
                            </p>
                            <p className="text-sm">
                                <strong>Brand:</strong> {product.brand}
                            </p>
                            {product.sub_brand && (
                                <p className="text-sm">
                                    <strong>Alternative Name:</strong>{" "}
                                    {product.sub_brand}
                                </p>
                            )}
                            <p className="text-sm">
                                <strong>Capacity:</strong> {product.capacity}ml
                            </p>
                            {product.sub_brand && (
                                <p className="text-sm">
                                    <strong>Year:</strong>{" "}
                                    {product.harvest_year}
                                </p>
                            )}
                        </div>
                    </div>
                    <div
                        style={{ marginBottom: -24 }}
                        className="space-x-8 sm:-my-px sm:ml-10 sm:flex"
                    >
                        <Tab
                            active={currentTab == 0}
                            onClick={() => setCurrentTab(0)}
                        >
                            Stores
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
            {console.log({ product })}
            <Head title={product.name} />

            <div className="py-12 max-w-7xl mx-auto sm:px-6 lg:px-8">
                {currentTab == 0 && (
                    <>
                        <h3 className="text-xl mb-4 font-medium text-gray-900">
                            Offers
                        </h3>
                        {uniqueOffers?.map((entry) => (
                            <>
                                <div
                                    key={entry.id}
                                    className="flex items-center p-4 mb-3 sm:p-8 bg-white shadow sm:rounded-lg"
                                >
                                    <img
                                        src={getStoreImg(entry.store_name)}
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
                                            {entry.currency}
                                        </p>
                                        <p className="text-xs">
                                            {dayjs(entry.created_at).toNow()}
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
                            </>
                        ))}
                    </>
                )}
                {currentTab == 1 && (
                    <ProductPriceHistory
                        history={realdata}
                        lastWeek={lastWeek}
                    />
                )}
            </div>
        </AuthenticatedLayout>
    );
}
