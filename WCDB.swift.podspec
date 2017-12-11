# pod lib lint --verbose WCDB.swift.podspec
# pod trunk push WCDB.swift.podspec --verbose
Pod::Spec.new do |wcdb|
  wcdb.name         = "WCDB.swift"
  wcdb.version      = "1.0.0"
  wcdb.summary      = "WCDB is a cross-platform database framework developed by WeChat."
  wcdb.description  = <<-DESC
                      The WeChat Database, for Swift. (If you want to use WCDB from Objective-C, see the "WCDB" pod.)

                      WCDB is an efficient, complete, easy-to-use mobile database framework used in the WeChat application.
                      It can be a replacement for Core Data, SQLite & FMDB.
                      DESC
  wcdb.homepage     = "https://github.com/Tencent/wcdb"
  wcdb.license      = { :type => "BSD", :file => "LICENSE"}
  wcdb.author             = { "sanhuazhang" => "sanhuazhang@tencent.com" }
  wcdb.ios.deployment_target = "8.0"
  wcdb.osx.deployment_target = "10.9"
  wcdb.watchos.deployment_target = "2.0"
  wcdb.tvos.deployment_target = "9.0"
  wcdb.source       = { :git => "https://github.com/Tencent/wcdb.git", :tag => "v#{wcdb.version}" }
  wcdb.source_files  = "swift/source/**/*.swift", "swift/source/**/**/*.swift", "swift/source/util/*.{h,c}", "repair"
  wcdb.module_name = "WCDB"
  wcdb.libraries = "z"
  wcdb.requires_arc = true
  wcdb.prepare_command = "git submodule update --init sqlcipher; \
                          cd tools/xctemplate; make; cd ../..; \
                          cd sqlcipher; make -f Makefile.preprocessed; cd ..; \
                          cp sqlcipher/ext/fts3/fts3_tokenizer.h sqlcipher/"
  wcdb.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
                               'APPLICATION_EXTENSION_API_ONLY' => 'YES' }
  wcdb.xcconfig = {
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) WCDB_BUILTIN_SQLCIPHER WCDB_COCOAPODS",
    "HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/WCDBSwift",
    "LIBRARY_SEARCH_PATHS[sdk=macosx*]" => "$(inherited) $(SDKROOT)/usr/lib/system",
    "OTHER_SWIFT_FLAGS" => "-D WCDB_HAS_CODEC",
    "OTHER_SWIFT_FLAGS[sdk=iphonesimulator*]" => "-D WCDB_HAS_CODEC -D WCDB_IOS",
    "OTHER_SWIFT_FLAGS[sdk=iphoneos*]" => "-D WCDB_HAS_CODEC -D WCDB_IOS",
    "SWIFT_VERSION" => "4.0",
  }

  wcdb.default_subspec  = 'sqlcipher'

  wcdb.subspec 'sqlcipher' do |sqlcipher|
    sqlcipher.public_header_files = "sqlcipher/sqlite3.h", "sqlcipher/fts3_tokenizer.h"
    sqlcipher.source_files = "sqlcipher/src/callback.c", "sqlcipher/src/loadext.c", "sqlcipher/src/rowset.c", "sqlcipher/src/treeview.c", "sqlcipher/ext/userauth.c", "sqlcipher/src/vtab.c", "sqlcipher/src/btmutex.c", "sqlcipher/src/btree.c", "sqlcipher/src/btreeInt.h", "sqlcipher/src/btree.h", "sqlcipher/fts5.c", "sqlcipher/fts5.h", "sqlcipher/ext/fts3/fts3_aux.c", "sqlcipher/ext/fts3/fts3_expr.c", "sqlcipher/ext/fts3/fts3_hash.c", "sqlcipher/ext/fts3/fts3_hash.h", "sqlcipher/ext/fts3/fts3_icu.c", "sqlcipher/ext/fts3/fts3_porter.c", "sqlcipher/ext/fts3/fts3_snippet.c", "sqlcipher/ext/fts3/fts3_tokenize_vtab.c", "sqlcipher/ext/fts3/fts3_tokenizer.c", "sqlcipher/ext/fts3/fts3_tokenizer1.c", "sqlcipher/ext/fts3/fts3_unicode.c", "sqlcipher/ext/fts3/fts3_unicode2.c", "sqlcipher/ext/fts3/fts3_write.c", "sqlcipher/ext/fts3/fts3.c", "sqlcipher/ext/fts3/fts3.h", "sqlcipher/ext/fts3/fts3Int.h", "sqlcipher/src/backup.c", "sqlcipher/src/legacy.c", "sqlcipher/src/main.c", "sqlcipher/src/notify.c", "sqlcipher/src/vdbeapi.c", "sqlcipher/src/table.c", "sqlcipher/src/wal.c", "sqlcipher/src/wal.h", "sqlcipher/src/status.c", "sqlcipher/src/prepare.c", "sqlcipher/src/malloc.c", "sqlcipher/src/mem0.c", "sqlcipher/src/mem1.c", "sqlcipher/src/mem2.c", "sqlcipher/src/mem3.c", "sqlcipher/src/mem5.c", "sqlcipher/src/memjournal.c", "sqlcipher/src/mutex_unix.c", "sqlcipher/src/mutex_noop.c", "sqlcipher/src/mutex.c", "sqlcipher/src/mutex.h", "sqlcipher/src/os_common.h", "sqlcipher/src/os_setup.h", "sqlcipher/src/os_unix.c", "sqlcipher/src/queue.c", "sqlcipher/src/queue.h", "sqlcipher/src/os_wcdb.c", "sqlcipher/src/os_wcdb.h", "sqlcipher/src/mutex_wcdb.c", "sqlcipher/src/mutex_wcdb.h", "sqlcipher/src/os.c", "sqlcipher/src/os.h", "sqlcipher/src/threads.c", "sqlcipher/src/bitvec.c", "sqlcipher/src/pager.c", "sqlcipher/src/pager.h", "sqlcipher/src/pcache.c", "sqlcipher/src/pcache.h", "sqlcipher/src/pcache1.c", "sqlcipher/ext/rtree/rtree.c", "sqlcipher/ext/rtree/rtree.h", "sqlcipher/ext/rtree/sqlite3rtree.h", "sqlcipher/src/complete.c", "sqlcipher/src/tokenize.c", "sqlcipher/src/resolve.c", "sqlcipher/parse.c", "sqlcipher/parse.h", "sqlcipher/src/analyze.c", "sqlcipher/src/func.c", "sqlcipher/src/wherecode.c", "sqlcipher/src/whereexpr.c", "sqlcipher/src/whereInt.h", "sqlcipher/src/alter.c", "sqlcipher/src/attach.c", "sqlcipher/src/auth.c", "sqlcipher/src/build.c", "sqlcipher/src/delete.c", "sqlcipher/src/expr.c", "sqlcipher/src/insert.c", "sqlcipher/src/pragma.c", "sqlcipher/src/pragma.h", "sqlcipher/src/select.c", "sqlcipher/src/trigger.c", "sqlcipher/src/update.c", "sqlcipher/src/vacuum.c", "sqlcipher/src/walker.c", "sqlcipher/src/where.c", "sqlcipher/opcodes.c", "sqlcipher/opcodes.h", "sqlcipher/src/sqlcipher.h", "sqlcipher/sqlite3.h", "sqlcipher/ext/rbu/sqlite3rbu.c", "sqlcipher/ext/rbu/sqlite3rbu.h", "sqlcipher/ext/userauth/sqlite3userauth.h", "sqlcipher/ext/misu/json1.c", "sqlcipher/ext/icu/icu.c", "sqlcipher/ext/icu/sqliteicu.h", "sqlcipher/src/global.c", "sqlcipher/src/ctime.c", "sqlcipher/src/hwtime.h", "sqlcipher/src/date.c", "sqlcipher/src/dbstat.c", "sqlcipher/src/fault.c", "sqlcipher/src/fkey.c", "sqlcipher/src/sqliteInt.h", "sqlcipher/src/sqliteLimit.h", "sqlcipher/src/sqlite3ext.h", "sqlcipher/src/hash.c", "sqlcipher/src/hash.h", "sqlcipher/src/printf.c", "sqlcipher/src/random.c", "sqlcipher/src/utf.c", "sqlcipher/src/util.c", "sqlcipher/src/crypto_cc.c", "sqlcipher/src/crypto_impl.c", "sqlcipher/src/crypto_libtomcrypt.c", "sqlcipher/src/crypto.c", "sqlcipher/src/crypto.h", "sqlcipher/src/vdbe.c", "sqlcipher/src/vdbe.h", "sqlcipher/src/vdbeaux.c", "sqlcipher/src/vdbeblob.c", "sqlcipher/src/vdbeInt.h", "sqlcipher/src/vdbemem.c", "sqlcipher/src/vdbesort.c", "sqlcipher/src/vdbetrace.c", "sqlcipher/src/msvc.h", "sqlcipher/src/vxworks.h", "sqlcipher/fts3_tokenizer.h", "sqlcipher/keywordhash.h"
    sqlcipher.ios.deployment_target = "8.0"
    sqlcipher.osx.deployment_target = "10.9"
    sqlcipher.xcconfig = {
      "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) SQLITE_ENABLE_FTS3 SQLITE_ENABLE_FTS3_PARENTHESIS SQLITE_ENABLE_API_ARMOR SQLITE_OMIT_BUILTIN_TEST SQLITE_OMIT_AUTORESET SQLITE_ENABLE_UPDATE_DELETE_LIMIT SQLITE_ENABLE_RTREE SQLITE_ENABLE_LOCKING_STYLE=1 SQLITE_SYSTEM_MALLOC SQLITE_OMIT_LOAD_EXTENSION SQLITE_CORE SQLITE_THREADSAFE=2 SQLITE_DEFAULT_CACHE_SIZE=250 SQLITE_DEFAULT_CKPTFULLFSYNC=1 SQLITE_DEFAULT_PAGE_SIZE=4096 SQLITE_OMIT_SHARED_CACHE SQLITE_HAS_CODEC SQLCIPHER_CRYPTO_CC USE_PREAD=1 SQLITE_TEMP_STORE=2 SQLCIPHER_PREPROCESSED HAVE_USLEEP SQLITE_MALLOC_SOFT_LIMIT=0 SQLITE_WCDB_SIGNAL_RETRY=1 SQLITE_DEFAULT_MEMSTATUS=0 SQLITE_ENABLE_COLUMN_METADATA SQLITE_DEFAULT_WAL_SYNCHRONOUS=1 SQLITE_LIKE_DOESNT_MATCH_BLOBS SQLITE_MAX_EXPR_DEPTH=0 SQLITE_OMIT_DEPRECATED SQLITE_OMIT_PROGRESS_CALLBACK SQLITE_OMIT_SHARED_CACHE OMIT_CONSTTIME_MEM OMIT_MEMLOCK",
      "CLANG_WARN_CONSTANT_CONVERSION" => "YES",
      "CLANG_CXX_LANGUAGE_STANDARD" => "gnu++0x",
      "CLANG_CXX_LIBRARY" => "libc++",
      "GCC_WARN_64_TO_32_BIT_CONVERSION" => "NO",
      "CLANG_WARN_UNREACHABLE_CODE" => "NO",
      "GCC_WARN_UNUSED_FUNCTION" => "NO",
      "GCC_WARN_UNUSED_VARIABLE" => "NO",
    }
  end
end
