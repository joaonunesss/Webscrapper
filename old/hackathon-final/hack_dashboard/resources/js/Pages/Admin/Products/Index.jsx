import React from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import Products from "@/Components/Products";
import PrimaryButton from "@/Components/PrimaryButton";
import { Head } from "@inertiajs/react";
import { router } from "@inertiajs/react";

export default function Index({ auth, products, admin }) {
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className="flex justify-between">
                    <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                        Products
                    </h2>
                </div>
            }
        >
            <Head title="Products" />
            {console.log({ auth })}

            <div className="py-12 max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                <div className="flex justify-end">
                    <PrimaryButton
                        onClick={() => router.get("/admin/products/create")}
                    >
                        Add Product
                    </PrimaryButton>
                </div>
                <Products products={products} admin={admin} />
            </div>
        </AuthenticatedLayout>
    );
}
