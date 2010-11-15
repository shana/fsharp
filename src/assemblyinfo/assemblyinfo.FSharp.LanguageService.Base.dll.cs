using System.Reflection;

#if NO_STRONG_NAMES
// Note: internals visible to unit test DLLs in Retail (and all) builds.
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("Salsa")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("Unittests")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("SystematicUnitTests")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.ProjectSystem.Base")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.LanguageService")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.ProjectSystem.FSharp")]
#else

// Note: internals visible to unit test DLLs in Retail (and all) builds.
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("Salsa, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("Unittests, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("SystematicUnitTests, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.ProjectSystem.Base, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.LanguageService, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
[assembly:System.Runtime.CompilerServices.InternalsVisibleTo("FSharp.ProjectSystem.FSharp, PublicKey=002400000480000094000000060200000024000052534131000400000100010069E72B918AD037CB584E6E4C5FB42C9130A755C4E4067826B9930C3737C7AF5714F617AE728E3C3FDFEB5D233566FE01E5200F6A2A5A9F30B951D70048D4925503035A22E237B47F87BC35090258B9ACF9F60AD35BF3B57CE343B3D4DE3B9153324289053F43C1F38DD176A19D1C1796C4DBF00886E5539D3E12B38C7D440CF4")]
#endif
