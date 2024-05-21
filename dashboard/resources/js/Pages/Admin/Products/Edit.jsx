import React, { useState } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import InputError from "@/Components/InputError";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import PrimaryButton from "@/Components/PrimaryButton";
import SecondaryButton from "@/Components/SecondaryButton";
import { useForm, Head, router } from "@inertiajs/react";
import { toast } from "react-toastify";

export default function Edit({ auth, product }) {
    const { data, setData, patch, processing, reset, errors } = useForm({
        id: product.id,
        name: product.name,
        img: product.img,
        capacity: product.capacity,
        harvest_year: product.harvest_year,
        brand: product.brand ? product.brand : "",
        sub_brand: product.sub_brand ? product.sub_brand : "",
    });

    const submit = (e) => {
        e.preventDefault();
        patch(route("admin.products.update", product.id), {
            onSuccess: () => {
                toast.success("Product updated successfully.");
                reset();
            },
            onError: () => {
                toast.error("Error updating the product!");
            },
        });
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className="flex justify-between">
                    <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                        Update Product
                    </h2>
                </div>
            }
        >
            <Head title="Update Product" />

            <div className="max-w-2xl mx-auto p-4 sm:p-6 lg:p-8">
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

                <div className="p-4 sm:p-8 bg-white shadow rounded-lg">
                    <header>
                        <h2 className="text-lg font-medium text-gray-900">
                            Update Product
                        </h2>
                    </header>

                    <form onSubmit={submit} className="mt-6 space-y-6">
                        <div>
                            <InputLabel htmlFor="id" value="EAN" />

                            <TextInput
                                id="id"
                                type="text"
                                name="id"
                                value={data.id}
                                className="mt-1 block w-full"
                                isfocused={true}
                                onChange={(e) => setData("id", e.target.value)}
                            />

                            <InputError message={errors.id} className="mt-2" />
                        </div>

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
                            <InputLabel htmlFor="img" value="Image URL" />

                            <TextInput
                                id="img"
                                type="text"
                                name="img"
                                value={data.img}
                                className="mt-1 block w-full"
                                onChange={(e) => setData("img", e.target.value)}
                            />

                            <InputError message={errors.img} className="mt-2" />
                        </div>

                        <div>
                            <InputLabel htmlFor="brand" value="Brand" />

                            <TextInput
                                id="brand"
                                type="text"
                                name="brand"
                                value={data.brand}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("brand", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.brand}
                                className="mt-2"
                            />
                        </div>

                        <div>
                            <InputLabel htmlFor="sub_brand" value="Sub Brand" />

                            <TextInput
                                id="sub_brand"
                                type="text"
                                name="sub_brand"
                                value={data.sub_brand}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("sub_brand", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.sub_brand}
                                className="mt-2"
                            />
                        </div>

                        <div>
                            <InputLabel
                                htmlFor="capacity"
                                value="Capacity (ml)"
                            />

                            <TextInput
                                id="capacity"
                                type="number"
                                name="capacity"
                                min="1"
                                value={data.capacity}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("capacity", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.capacity}
                                className="mt-2"
                            />
                        </div>

                        {/* <div>
                            <InputLabel
                                htmlFor="harvest_year"
                                value="Year (ml)"
                            />

                            <TextInput
                                id="harvest_year"
                                type="number"
                                name="harvest_year"
                                min="1"
                                value={data.harvest_year}
                                className="mt-1 block w-full"
                                onChange={(e) =>
                                    setData("harvest_year", e.target.value)
                                }
                            />

                            <InputError
                                message={errors.capacity}
                                className="mt-2"
                            />
                        </div> */}

                        <div className="flex justify-end">
                            {/* <SecondaryButton
                                type="button"
                                className="mt-4 mr-2"
                                onClick={() => router.get("/admin/products")}
                            >
                                Cancelar
                            </SecondaryButton> */}
                            <PrimaryButton
                                className="mt-4"
                                disabled={processing}
                            >
                                Update Product
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
