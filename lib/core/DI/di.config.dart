// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_datasource_contract/all_brands_datasource_contract.dart'
    as _i4;
import '../../data/api_datasource_contract/all_categories_datasource_contract.dart'
    as _i12;
import '../../data/api_datasource_contract/auth_datasource_contract.dart'
    as _i18;
import '../../data/api_datasource_contract/get_user_data_datasource_contract.dart'
    as _i10;
import '../../data/api_datasource_contract/product_datasource_contract.dart'
    as _i6;
import '../../data/api_datasource_contract/products_by_category_id_contract.dart'
    as _i14;
import '../../data/api_datasource_contract/sub_category_datasource_contract.dart'
    as _i8;
import '../../data/api_datasource_impl/all_brands_datasource_impl.dart' as _i5;
import '../../data/api_datasource_impl/all_categories_datasource_impl.dart'
    as _i13;
import '../../data/api_datasource_impl/auth_datasource_impl.dart' as _i19;
import '../../data/api_datasource_impl/get_user_data_datasource_impl.dart'
    as _i11;
import '../../data/api_datasource_impl/products_by_category_id_impl.dart'
    as _i15;
import '../../data/api_datasource_impl/products_datasource_impl.dart' as _i7;
import '../../data/api_datasource_impl/sub_category_datasource_impl.dart'
    as _i9;
import '../../data/repository_impl/all_brands_repo_impl.dart' as _i32;
import '../../data/repository_impl/all_categories_repo_impl.dart' as _i25;
import '../../data/repository_impl/get_user_data_repo_impl.dart' as _i17;
import '../../data/repository_impl/product_repo_impl.dart' as _i23;
import '../../data/repository_impl/products_by_subcategory_id_repo_impl.dart'
    as _i21;
import '../../data/repository_impl/auth_repo_impl.dart' as _i36;
import '../../data/repository_impl/sub_category_repo_impl.dart' as _i29;
import '../../domain/repository_contract/all_brands_repo.dart' as _i31;
import '../../domain/repository_contract/all_categories_repo.dart' as _i24;
import '../../domain/repository_contract/auth_repo.dart' as _i35;
import '../../domain/repository_contract/get_user_data_repo.dart' as _i16;
import '../../domain/repository_contract/product_repo.dart' as _i22;
import '../../domain/repository_contract/products_by_subcategory_id_repo.dart'
    as _i20;
import '../../domain/repository_contract/sub_category_repo.dart' as _i28;
import '../../domain/use_cases/auth_cases/auth_usecase.dart' as _i44;
import '../../domain/use_cases/home_cases/brands_use_case.dart' as _i38;
import '../../domain/use_cases/home_cases/categories_usecase.dart' as _i33;
import '../../domain/use_cases/home_cases/most_selling_products_usecase.dart'
    as _i37;
import '../../domain/use_cases/home_cases/sub_category_usecase.dart' as _i34;
import '../../domain/use_cases/product_screen_cases/get_products_by_subcategory_id_usecase.dart'
    as _i27;
import '../../domain/use_cases/profile_cases/get_user_data_case.dart' as _i26;
import '../../presentation/screens/auth/auth_view_model.dart' as _i46;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/left_side_view_model.dart'
    as _i41;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/right_side_view_model.dart'
    as _i39;
import '../../presentation/screens/home/tabs/home_tab/view_models/brands_view_model.dart'
    as _i43;
import '../../presentation/screens/home/tabs/home_tab/view_models/categories_view_model.dart'
    as _i42;
import '../../presentation/screens/home/tabs/home_tab/view_models/most_selling_view_model.dart'
    as _i45;
import '../../presentation/screens/home/tabs/profile_tab/profile_view_model.dart'
    as _i30;
import '../../presentation/screens/products/products_view_model.dart' as _i40;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AllBrandsDatasourceContract>(
        () => _i5.AllBrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductDatasourceContract>(
        () => _i7.ProductDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SubCategoryDatasourceContract>(
        () => _i9.SubCategoryDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.GetUserDataDatasourceContract>(
        () => _i11.GetUserDataDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.AllCategoriesContract>(
        () => _i13.AllCategoriesImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.ProductsBySubCategoryId>(
        () => _i15.ProductsByCategoryIdImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.GetUserDataRepo>(() =>
        _i17.GetUserDataRepoImpl(gh<_i10.GetUserDataDatasourceContract>()));
    gh.factory<_i18.AuthDatasourceContract>(
        () => _i19.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i20.ProductsBySubcategoryIdRepo>(() =>
        _i21.ProductsBySubcategoryIdRepoImpl(
            gh<_i14.ProductsBySubCategoryId>()));
    gh.factory<_i22.ProductsRepo>(
        () => _i23.ProductsRepoImpl(gh<_i6.ProductDatasourceContract>()));
    gh.factory<_i24.AllCategoriesRepo>(
        () => _i25.AllCategoriesRepoImpl(gh<_i12.AllCategoriesContract>()));
    gh.factory<_i26.GetUserDataUseCase>(
        () => _i26.GetUserDataUseCase(gh<_i16.GetUserDataRepo>()));
    gh.factory<_i27.GetProductsBySubcategoryIdUsecase>(() =>
        _i27.GetProductsBySubcategoryIdUsecase(
            gh<_i20.ProductsBySubcategoryIdRepo>()));
    gh.factory<_i28.SubCategoryRepo>(() =>
        _i29.SubCategoryRepoImpl(gh<_i8.SubCategoryDatasourceContract>()));
    gh.factory<_i30.ProfileViewModel>(
        () => _i30.ProfileViewModel(gh<_i26.GetUserDataUseCase>()));
    gh.factory<_i31.AllBrandsRepo>(
        () => _i32.AllBrandsRepoImpl(gh<_i4.AllBrandsDatasourceContract>()));
    gh.factory<_i33.CategoriesUseCase>(
        () => _i33.CategoriesUseCase(gh<_i24.AllCategoriesRepo>()));
    gh.factory<_i34.SubCategoryUseCase>(
        () => _i34.SubCategoryUseCase(gh<_i28.SubCategoryRepo>()));
    gh.factory<_i35.AuthRepo>(
        () => _i36.AuthRepoImpl(gh<_i18.AuthDatasourceContract>()));
    gh.factory<_i37.MostSellingProductsUsecase>(
        () => _i37.MostSellingProductsUsecase(gh<_i22.ProductsRepo>()));
    gh.factory<_i38.BrandUsecase>(
        () => _i38.BrandUsecase(gh<_i31.AllBrandsRepo>()));
    gh.factory<_i39.RightSideViewModel>(
        () => _i39.RightSideViewModel(gh<_i34.SubCategoryUseCase>()));
    gh.factory<_i40.ProductsBySubcategoryIdViewModel>(() =>
        _i40.ProductsBySubcategoryIdViewModel(
            gh<_i27.GetProductsBySubcategoryIdUsecase>()));
    gh.factory<_i41.LeftSideViewModel>(
        () => _i41.LeftSideViewModel(gh<_i33.CategoriesUseCase>()));
    gh.factory<_i42.CategoriesViewModel>(
        () => _i42.CategoriesViewModel(gh<_i33.CategoriesUseCase>()));
    gh.factory<_i43.BrandViewModel>(
        () => _i43.BrandViewModel(gh<_i38.BrandUsecase>()));
    gh.factory<_i44.SignupUseCase>(
        () => _i44.SignupUseCase(gh<_i35.AuthRepo>()));
    gh.factory<_i45.MostSellingProductsViewModel>(() =>
        _i45.MostSellingProductsViewModel(
            gh<_i37.MostSellingProductsUsecase>()));
    gh.factory<_i46.AuthViewModel>(
        () => _i46.AuthViewModel(gh<_i44.SignupUseCase>()));
    return this;
  }
}
