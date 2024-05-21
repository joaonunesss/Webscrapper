import React, { useState } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import PrimaryButton from "@/Components/PrimaryButton";
import SecondaryButton from "@/Components/SecondaryButton";
import { useForm, Head, router } from "@inertiajs/react";
import Tab from "@/Components/Tab";

export default function Edit({ auth, product }) {
    const [tabValue, setTabValue] = useState(0);
    const [currentTab, setCurrentTab] = useState(0);
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <>
                    <SecondaryButton
                        type="button"
                        className="mb-6"
                        onClick={() => router.get("/admin/products")}
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
                        <img
                            className="max-h-32"
                            src="https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dw1f8ba263/images/col/377/3777012-frente.jpg?sw=2000&sh=2000"
                        />
                        <div>
                            <h2 className="mb-4 font-semibold text-xl text-gray-800 leading-tight">
                                {product.name}
                            </h2>

                            <p className="text-sm">
                                <strong>Brand:</strong> {product.brand}
                            </p>
                            {product.sub_brand && (
                                <p className="text-sm">
                                    <strong>Brand:</strong> {product.sub_brand}
                                </p>
                            )}
                            <p className="text-sm">
                                <strong>Brand:</strong> {product.capacity}
                            </p>
                            {product.sub_brand && (
                                <p className="text-sm">
                                    <strong>Brand:</strong>{" "}
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
                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <header>
                            <h2 className="text-lg font-medium text-gray-900">
                                {product.name}
                            </h2>
                        </header>
                    </div>
                )}
                {currentTab == 1 && <>price history here</>}
            </div>
        </AuthenticatedLayout>
    );
}
