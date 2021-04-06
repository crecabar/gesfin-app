import AllProduct from "./components/AllProduct";
import CreateProduct from "./components/CreateProduct";
import EditProduct from "./components/EditProduct";

export const routes = [
    {
        name: 'home',
        path: '/',
        component: AllProduct
    },
    {
        name: 'create',
        path: '/create',
        component: CreateProduct
    },
    {
        name: 'edit',
        path: '/edit',
        component: EditProduct
    }
]
