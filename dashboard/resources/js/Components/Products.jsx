import React from "react";
import { router } from "@inertiajs/react";
import dayjs from "dayjs";

import deleteDialog from "@/Components/DeleteDialog";

export default function Products({ products, admin }) {
    const deleteProduct = (productId, productName) => {
        deleteDialog(
            route("admin.products.destroy", productId),
            `Are you sure you want to delete "${productName}"?`
        );
    };
    return (
        <div className="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table className="w-full text-sm text-left text-gray-500">
                <thead className="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col" className="px-6 py-3">
                            EAN
                        </th>
                        <th scope="col" className="px-6 py-3">
                            Name
                        </th>
                        <th scope="col" className="px-6 py-3">
                            Capacity
                        </th>
                        <th scope="col" className="px-6 py-3">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {products.map((product) => (
                        <tr key={product.id} className="bg-white border-b">
                            <th
                                scope="row"
                                className="px-6 py-4 whitespace-nowrap"
                            >
                                {product.id}
                            </th>
                            <td className="px-6 font-medium text-gray-900 py-4">
                                {product.name}
                            </td>
                            <td className="px-6 font-medium text-gray-900 py-4">
                                {product.capacity}ml
                            </td>
                            <td className="px-6 py-4">
                                <a
                                    href={route("products.show", product.id)}
                                    className="font-medium text-blue-600 hover:underline mr-2"
                                >
                                    View
                                </a>
                                {admin && (
                                    <>
                                        <a
                                            href={route(
                                                "admin.products.edit",
                                                product.id
                                            )}
                                            className="font-medium text-blue-600 hover:underline mr-2"
                                        >
                                            Edit
                                        </a>
                                        <button
                                            onClick={() =>
                                                deleteProduct(
                                                    product.id,
                                                    product.name
                                                )
                                            }
                                            className="font-medium text-red-600 hover:underline"
                                        >
                                            Delete
                                        </button>
                                    </>
                                )}
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
