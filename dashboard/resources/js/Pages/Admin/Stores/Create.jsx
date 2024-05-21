import React, { useState } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import PrimaryButton from "@/Components/PrimaryButton";
import SecondaryButton from "@/Components/SecondaryButton";
import { useForm, Head, router } from "@inertiajs/react";
import { IoIosAlert } from "react-icons/io";
import { IoIosCheckmarkCircle } from "react-icons/io";
import { AiOutlineLoading3Quarters } from "react-icons/ai";
import { toast } from "react-toastify";

export default function Create({ auth }) {
    // const [testCount, setTestCount] = useState(0);
    // const [validStore, setValidStore] = useState(false);
    // const [loading, setLoading] = useState(false);
    const { data, setData, post, processing, reset, errors } = useForm({
        name: "",
        search_url: "",
        logo_url: "",
    });

    // const testStore = () => {
    //     console.log("test store");
    //     setLoading(true);
    //     setTimeout(() => {
    //         setValidStore(Boolean(Math.floor(Math.random() * 2))); // simulate 50% chance
    //         setLoading(false);
    //         setTestCount((prev) => prev + 1);
    //     }, 1000);
    // };

    const submit = (e) => {
        e.preventDefault();
        post(route("admin.stores.store"), {
            onSuccess: () => {
                toast.success("Store added successfully.");
                reset();
            },
            onError: () => {
                toast.error("Error adding a store!");
            },
        });
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className="flex justify-between">
                    <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                        New Store
                    </h2>
                </div>
            }
        >
            <Head title="New Store" />

            <div className="max-w-2xl mx-auto p-4 sm:p-6 lg:p-8">
                <SecondaryButton
                    type="button"
                    className="mb-6"
                    onClick={() => router.get("/admin/stores")}
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

                <div className="p-4 sm:p-8 bg-white shadow rounded-lg">
                    <header>
                        <h2 className="text-lg font-medium text-gray-900">
                            Register a new Store
                        </h2>
                    </header>

                    <form onSubmit={submit} className="mt-6 space-y-6">
                        <div>
                            <InputLabel htmlFor="name" value="Name" />

                            <TextInput
                                id="name"
                                type="text"
                                name="name"
                                value={data.name}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("name", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.name}
                                className="mt-2"
                            />
                        </div>

                        <div>
                            <InputLabel
                                htmlFor="search_url"
                                value="Search URL"
                            />

                            <TextInput
                                id="search_url"
                                type="text"
                                name="search_url"
                                value={data.search_url}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("search_url", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.search_url}
                                className="mt-2"
                            />
                        </div>

                        <div>
                            <InputLabel htmlFor="logo_url" value="Logo URL" />

                            <TextInput
                                id="logo_url"
                                type="text"
                                name="logo_url"
                                value={data.logo_url}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("logo_url", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.logo_url}
                                className="mt-2"
                            />
                        </div>

                        {/* <div>
                            <PrimaryButton
                                type="button"
                                className="mt-4 mr-2"
                                onClick={() => testStore()}
                                disabled={loading}
                            >
                                Test Store
                            </PrimaryButton>
                            {Boolean(loading) && (
                                <AiOutlineLoading3Quarters className="animate-spin inline-block" />
                            )}
                            {Boolean(testCount && !loading) && (
                                <>
                                    {Boolean(validStore) ? (
                                        <span className="text-green-600">
                                            <IoIosCheckmarkCircle className="inline-block mr-1" />
                                            Valid Store
                                        </span>
                                    ) : (
                                        <span className="text-red-600 ">
                                            <IoIosAlert className="inline-block mr-1" />
                                            This Store is not supported
                                        </span>
                                    )}
                                </>
                            )}
                        </div> */}

                        <div className="flex justify-end">
                            <SecondaryButton
                                type="button"
                                className="mt-4 mr-2"
                                onClick={() => router.get("/admin/stores")}
                            >
                                Cancelar
                            </SecondaryButton>
                            <PrimaryButton
                                className="mt-4"
                                disabled={processing}
                            >
                                Add Store
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
