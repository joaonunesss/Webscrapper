import React from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import PrimaryButton from "@/Components/PrimaryButton";
import { Head } from "@inertiajs/react";
import { router } from "@inertiajs/react";
import ProductsGrid from "@/Components/ProductsGrid";

export default function Index({ auth, products, admin, query, capacity }) {
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
            {console.log({ admin, products })}

            <div className="py-12 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
                <ProductsGrid
                    products={products}
                    admin={admin}
                    query={query}
                    querycapacity={capacity}
                />
            </div>
        </AuthenticatedLayout>
    );
}
